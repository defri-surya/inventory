<?php

namespace App\Http\Controllers\StaffToko;

use App\Models\Product;
use App\Models\MasterValue;
use Exception;
use App\Models\Unit;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Illuminate\Support\Facades\Redirect;
use PhpOffice\PhpSpreadsheet\Writer\Xls;
use Picqer\Barcode\BarcodeGeneratorHTML;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use Haruncpi\LaravelIdGenerator\IdGenerator;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Controller;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\File;
use App\Models\Gudang;
use App\Models\ListToko;
use App\Models\ProductToko;
use App\Models\Supplier;
use App\Models\shoppingcart;

class ProductTokoController extends Controller
{
    public function index()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }
        // Membuat kunci cache unik berdasarkan parameter query
        $cacheKey = 'products_' . http_build_query(request()->query());


        // Mendapatkan hasil dari cache atau menjalankan query jika cache tidak tersedia
        $view = Cache::remember($cacheKey, 60, function () use ($row) {
            $toko_id = ListToko::where('user_id', auth()->user()->id)->first();
            $products = ProductToko::with(['category'])
                ->where('toko_id', $toko_id->id)
                ->filter(request(['search']))
                ->sortable()
                ->paginate($row)
                ->appends(request()->query());

            return view('StaffToko.products.index', ['products' => $products])->render();
        });

        return $view;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('StaffToko.products.create', [
            'categories' => Category::all(),
            'units' => Unit::all(),
            'brands' => MasterValue::where('id', '=', 1)->with('detailValues')->get(),
            'grades' => MasterValue::where('id', '=', 2)->with('detailValues')->get(),
            'groups' => MasterValue::where('id', '=', 3)->with('detailValues')->get(),
            'types' => MasterValue::where('id', '=', 4)->with('detailValues')->get(),
            'item_types' => MasterValue::where('id', '=', 5)->with('detailValues')->get(),
            'mades' => MasterValue::where('id', '=', 6)->with('detailValues')->get(),
            'supplier' => Gudang::get(),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // $product_code = IdGenerator::generate([
        //     'table' => 'products',
        //     'field' => 'product_code',
        //     'length' => 4,
        //     'prefix' => 'PC'
        // ]);

        $rules = [
            'product_image' => 'image|file|max:2048',
            'product_name' => 'required|string',
            'product_code' => 'required|string',
            'category_id' => 'required|integer',
            'grade_id' => 'nullable|integer',
            'made_in_id' => 'nullable|integer',
            'gudang_id' => 'nullable|integer',
            'stock' => 'required|integer',
            'min_stock' => 'required|integer',
            'weight' => 'required|integer',
            'buying_price' => 'required|integer',
            'selling_price' => 'required|integer',
            'detail' => 'required|string',
            'discount_price' => 'nullable|integer',
            'discount_percent' => 'nullable|integer',
        ];
        //        dd($request->all());

        $toko_id = ListToko::where('user_id', auth()->user()->id)->first();
        $validatedData = $request->validate($rules);
        $validatedData['toko_id'] = $toko_id->id;

        // dd($validatedData);
        // Save product code value
        // $validatedData['product_code'] = $product_code;

        /**
         * Handle upload image
         */
        if ($file = $request->file('product_image')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/products/';

            /**
             * Upload an image to Storage
             */
            $file->storeAs($path, $fileName);
            $validatedData['product_image'] = $fileName;
        }

        ProductToko::create($validatedData);

        return Redirect::route('products-toko.index')->with('success', 'Product has been created!');
    }

    /**
     * Display the specified resource.
     */
    public function show($name)
    {

        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $products = ProductToko::where('product_name', '=', $name)->with(['category', 'unit', 'supplier'])
            ->filter(request(['search']))
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        $product = ProductToko::where('product_name', '=', $name)
            ->with('unit')
            ->with('category')
            ->with('detailMasterValueBrand')
            ->with('detailMasterValueGrade')
            ->with('detailMasterValueGroup')
            ->with('detailMasterValueType')
            ->with('detailMasterValueItemType')
            ->with('detailMasterValueMadeIn')
            ->first();

        $productUrl = route('products-toko.show', ['name' => $name]);

        // dd($product);

        // Generate a barcode
        $barcode = QrCode::style('round')->eye('circle')->size(200)->format('svg')->generate($productUrl);

        // Define the path to save the barcode
        $directory = public_path('qrcode');
        if (!File::exists($directory)) {
            File::makeDirectory($directory, 0755, true);
        }
        $filename = 'qrcode-' . $name . '.svg';
        $filePath = $directory . '/' . $filename;

        // Save the barcode to the file
        File::put($filePath, $barcode);
        // dd($productUrl);

        return view('StaffToko.products.show', [
            'products' => $products,
            'product' => $product,
            'barcode' => $barcode,
            'filename' => $filename,

        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ProductToko $productToko, $id)
    {
        return view('StaffToko.products.edit', [
            'categories' => Category::all(),
            'units' => Unit::all(),
            'brands' => MasterValue::where('id', '=', 1)->with('detailValues')->get(),
            'grades' => MasterValue::where('id', '=', 2)->with('detailValues')->get(),
            'groups' => MasterValue::where('id', '=', 3)->with('detailValues')->get(),
            'types' => MasterValue::where('id', '=', 4)->with('detailValues')->get(),
            'item_types' => MasterValue::where('id', '=', 5)->with('detailValues')->get(),
            'mades' => MasterValue::where('id', '=', 6)->with('detailValues')->get(),
            'product' => ProductToko::where('id', '=', $id)->first(),
            'supplier' => Gudang::get(),
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ProductToko $productToko, $id)
    {
        $rules = [
            'product_image' => 'image|file|max:2048',
            'product_name' => 'string',
            'product_code' => 'string',
            'category_id' => 'integer',
            'grade_id' => 'nullable|integer',
            'gudang_id' => 'nullable|integer',
            'made_in_id' => 'nullable|integer',
            'min_stock' => 'integer',
            'stock' => 'integer',
            'buying_price' => 'integer',
            'selling_price' => 'integer',
            'discount_percent' => 'integer',
            'discount_price' => 'integer',
            'detail' => 'string',
        ];

        $validatedData = $request->validate($rules);


        // dd($validatedData);
        /**
         * Handle upload an image
         */
        if ($file = $request->file('product_image')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/products/';

            /**
             * Delete photo if exists.
             */
            if ($productToko->product_image) {
                Storage::delete($path . $productToko->product_image);
            }

            /**
             * Store an image to Storage
             */
            $file->storeAs($path, $fileName);
            $validatedData['product_image'] = $fileName;
        }
        // dd($validatedData);
        ProductToko::where('id', $id)->update($validatedData);

        return Redirect::route('products-toko.index')->with('success', 'Product has been updated!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ProductToko $productToko)
    {
        /**
         * Delete photo if exists.
         */
        if ($productToko->product_image) {
            Storage::delete('public/products/' . $productToko->product_image);
        }

        ProductToko::destroy($productToko->id);

        return Redirect::route('products-toko.index')->with('success', 'Product has been deleted!');
    }

    /**
     * Handle export data products.
     */
    public function import()
    {
        return view('StaffToko.products.import');
    }

    public function handleImport(Request $request)
    {
        $request->validate([
            'file' => 'required|file|mimes:xls,xlsx',
        ]);

        $the_file = $request->file('file');

        try {
            $spreadsheet = IOFactory::load($the_file->getRealPath());
            $sheet        = $spreadsheet->getActiveSheet();
            $row_limit    = $sheet->getHighestDataRow();
            $column_limit = $sheet->getHighestDataColumn();
            $row_range    = range(2, $row_limit);
            $column_range = range('J', $column_limit);
            $startcount = 2;
            $data = array();
            foreach ($row_range as $row) {
                $data[] = [
                    'product_name' => $sheet->getCell('B' . $row)->getValue(),
                    'product_code' => $sheet->getCell('A' . $row)->getValue(),
                    'selling_price' => $sheet->getCell('C' . $row)->getValue(),
                    'detail' => $sheet->getCell('D' . $row)->getValue(),
                    'status_id' => 1,
                    'bagian' => 'Toko',
                ];
                $startcount++;
            }

            ProductToko::insert($data);
        } catch (Exception $e) {
            // $error_code = $e->errorInfo[1];
            return Redirect::route('products-toko.index')->with('error', 'There was a problem uploading the data!');
        }
        return Redirect::route('products-toko.index')->with('success', 'Data product has been imported!');
    }

    /**
     * Handle export data products.
     */
    function export()
    {
        $products = ProductToko::all()->sortBy('product_name');

        $product_array[] = array(
            'Product Name',
            'Category Id',
            'Unit Id',
            'Product Code',
            'Stock',
            'Buying Price',
            'Selling Price',
            'Product Image',
        );

        foreach ($products as $product) {
            $product_array[] = array(
                'Product Name' => $product->product_name,
                'Category Id' => $product->category_id,
                'Unit Id' => $product->unit_id,
                'Product Code' => $product->product_code,
                'Stock' => $product->stock,
                'Buying Price' => $product->buying_price,
                'Selling Price' => $product->selling_price,
                'Product Image' => $product->product_image,
            );
        }

        $this->exportExcel($product_array);
    }

    /**
     *This function loads the customer data from the database then converts it
     * into an Array that will be exported to Excel
     */
    public function exportExcel($products)
    {
        ini_set('max_execution_time', 0);
        ini_set('memory_limit', '4000M');

        try {
            $spreadSheet = new Spreadsheet();
            $spreadSheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(20);
            $spreadSheet->getActiveSheet()->fromArray($products);
            $Excel_writer = new Xls($spreadSheet);
            header('Content-Type: application/vnd.ms-excel');
            header('Content-Disposition: attachment;filename="products.xls"');
            header('Cache-Control: max-age=0');
            ob_end_clean();
            $Excel_writer->save('php://output');
            exit();
        } catch (Exception $e) {
            return;
        }
    }

    public function changeStatus(Request $request, $id)
    {
        $product = ProductToko::findOrFail($id);
        // dd($product);

        // Ubah status product
        $product->status_id = $request->input('status') ? 1 : 2;

        // Simpan perubahan
        $product->save();

        // Redirect kembali dengan pesan sukses
        return redirect()->route('products-toko.index')->with('success', 'Status product telah diperbarui!');
    }

    // Add to cart purchase
    public function addToCartPurchase(Request $request)
    {
        $rules = [
            'product_id' => 'required',
            'toko_id' => 'required',
        ];

        $validatedData = $request->validate($rules);

        shoppingcart::create($validatedData);

        return redirect()->back()->with('success', 'Product added to cart purchase successfully!');
    }

    public function removeCartPurchase($id)
    {
        $cart = shoppingcart::find($id);
        if (!$cart) {
            return response()->json(['error' => 'Cart item not found.'], 404);
        }

        try {
            $cart->delete();
            return response()->json(['success' => 'Product removed from cart purchase successfully.']);
        } catch (\Exception $e) {
            return response()->json(['error' => 'Error deleting item: ' . $e->getMessage()], 500);
        }
    }
}
