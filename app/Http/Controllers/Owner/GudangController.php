<?php

namespace App\Http\Controllers\Owner;

use App\Models\Gudang;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class GudangController extends Controller
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

        $listgudang = Gudang::filter(request(['search']))
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        return view('Owner.gudang.index', [
            'listgudang' => $listgudang
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('Owner.gudang.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'required|string|max:50',
            'email' => 'required|email|max:50|unique:list_gudangs,email',
            'phone' => 'required|string|max:25|unique:list_gudangs,phone',
            // 'shopname' => 'required|string|max:50',
            'npwp' => 'required|string|max:50',
            // 'type' => 'required|string|max:25',
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
            $path = 'public/listgudang/';

            /**
             * Store an image to Storage.
             */
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        Gudang::create($validatedData);

        return Redirect::route('list-gudang.index')->with('success', 'New supplier has been created!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Gudang $gudang)
    {
        abort(404);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Gudang $gudang, $id)
    {
        $gudang = Gudang::findOrFail($id);
        return view('Owner.gudang.edit', [
            'gudang' => $gudang
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Gudang $gudang, $id)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'string|max:50',
            'email' => 'email|max:50',
            'phone' => 'string|max:25',
            'npwp' => 'string|max:50',
            // 'shopname' => 'string|max:50',
            // 'type' => 'string|max:25',
            // 'account_holder' => 'max:50',
            // 'account_number' => 'max:25',
            // 'bank_name' => 'max:25',
            'address' => 'string|max:100',
        ];

        $validatedData = $request->validate($rules);
        $gudang = Gudang::findOrFail($id);

        /**
         * Handle upload image with Storage.
         */
        if ($file = $request->file('photo')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/listgudang/';

            /**
             * Delete an image if exists.
             */
            if ($gudang->photo) {
                Storage::delete($path . $gudang->photo);
            }

            // Store an image to Storage
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        Gudang::where('id', $id)->update($validatedData);

        return Redirect::route('list-gudang.index')->with('success', 'Supplier has been updated!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Gudang $gudang, $id)
    {
        /**
         * Delete photo if exists.
         */
        $gudang = Gudang::findOrFail($id);
        if ($gudang->photo) {
            Storage::delete('public/listgudang/' . $gudang->photo);
        }

        Gudang::destroy($gudang->id);

        return Redirect::route('list-gudang.index')->with('success', 'Supplier has been deleted!');
    }

    public function changeStatus(Request $request, $id)
    {
        $gudang = Gudang::findOrFail($id);

        // Ubah status gudang
        $gudang->status_id = $request->input('status') ? 1 : 2;

        // Simpan perubahan
        $gudang->save();

        // Redirect kembali dengan pesan sukses
        return redirect()->route('list-gudang.index')->with('success', 'Status gudang telah diperbarui!');
    }
}
