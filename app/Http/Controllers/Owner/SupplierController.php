<?php

namespace App\Http\Controllers\Owner;

use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use App\Http\Controllers\Controller;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $row = (int) request('row', 10);

        if ($row < 1 || $row > 100) {
            abort(400, 'The per-page parameter must be an integer between 1 and 100.');
        }

        $suppliers = Supplier::filter(request(['search']))
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('Owner.suppliers.index', [
            'suppliers' => $suppliers
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('Owner.suppliers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'required|string|max:50',
            'email' => 'required|email|max:50|unique:suppliers,email',
            'phone' => 'required|string|max:25|unique:suppliers,phone',
            // 'shopname' => 'required|string|max:50',
            'npwp' => 'required|string|max:50',
            'type' => 'required|string|max:25',
            'account_holder' => 'max:50',
            'account_number' => 'max:25',
            'bank_name' => 'max:25',
            'address' => 'required|string|max:100',
        ];

        $validatedData = $request->validate($rules);

        /**
         * Handle upload an image
         */
        if ($file = $request->file('photo')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/suppliers/';

            /**
             * Store an image to Storage.
             */
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        Supplier::create($validatedData);

        return Redirect::route('suppliers.index')->with('success', 'New supplier has been created!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Supplier $supplier)
    {
        abort(404);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Supplier $supplier)
    {
        return view('Owner.suppliers.edit', [
            'supplier' => $supplier
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Supplier $supplier)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'string|max:50',
            'email' => 'email|max:50',
            'phone' => 'string|max:25',
            'npwp' => 'required|string|max:50',
            'shopname' => 'string|max:50',
            'type' => 'string|max:25',
            'account_holder' => 'max:50',
            'account_number' => 'max:25',
            'bank_name' => 'max:25',
            'address' => 'string|max:100',
        ];

        $validatedData = $request->validate($rules);

        /**
         * Handle upload image with Storage.
         */
        if ($file = $request->file('photo')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/suppliers/';

            /**
             * Delete an image if exists.
             */
            if ($supplier->photo) {
                Storage::delete($path . $supplier->photo);
            }

            // Store an image to Storage
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        Supplier::where('id', $supplier->id)->update($validatedData);

        return Redirect::route('suppliers.index')->with('success', 'Supplier has been updated!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Supplier $supplier)
    {
        /**
         * Delete photo if exists.
         */
        if ($supplier->photo) {
            Storage::delete('public/suppliers/' . $supplier->photo);
        }

        Supplier::destroy($supplier->id);

        return Redirect::route('suppliers.index')->with('success', 'Supplier has been deleted!');
    }

    public function changeStatus(Request $request, $id)
    {
        $supplier = Supplier::findOrFail($id);

        // Ubah status supplier
        $supplier->status_id = $request->input('status') ? 1 : 2;

        // Simpan perubahan
        $supplier->save();

        // Redirect kembali dengan pesan sukses
        return redirect()->route('suppliers.index')->with('success', 'Status supplier telah diperbarui!');
    }
}
