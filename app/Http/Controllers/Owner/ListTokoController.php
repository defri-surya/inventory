<?php

namespace App\Http\Controllers\Owner;

use App\Http\Controllers\Controller;
use App\Models\ListToko;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use PhpParser\Node\Expr\List_;

class ListTokoController extends Controller
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

        $toko = ListToko::filter(request(['search']))
            ->sortable()
            ->paginate($row)
            ->appends(request()->query());

        // dd($toko);

        return view('Owner.toko.index', [
            'toko' => $toko
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('Owner.toko.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'required|string|max:50',
            'email' => 'required|email|max:50|unique:list_tokos,email',
            'phone' => 'required|string|max:25|unique:list_tokos,phone',
            'shopname' => 'required|string|max:50',
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
            $path = 'public/listtoko/';

            /**
             * Store an image to Storage.
             */
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        ListToko::create($validatedData);

        return Redirect::route('list-toko.index')->with('success', 'New supplier has been created!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        abort(404);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $listtoko = ListToko::findOrFail($id);
        return view('Owner.toko.edit', [
            'listtoko' => $listtoko
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $rules = [
            'photo' => 'image|file|max:1024',
            'name' => 'string|max:50',
            'email' => 'email|max:50',
            'phone' => 'string|max:25',
            'npwp' => 'string|max:50',
            'shopname' => 'string|max:50',
            'type' => 'string|max:25',
            'account_holder' => 'max:50',
            'account_number' => 'max:25',
            'bank_name' => 'max:25',
            'address' => 'string|max:100',
        ];

        $validatedData = $request->validate($rules);
        $listtoko = ListToko::where('id', $id)->first();

        /**
         * Handle upload image with Storage.
         */
        if ($file = $request->file('photo')) {
            $fileName = hexdec(uniqid()) . '.' . $file->getClientOriginalExtension();
            $path = 'public/listtoko/';

            /**
             * Delete an image if exists.
             */
            if ($listtoko->photo) {
                Storage::delete($path . $listtoko->photo);
            }

            // Store an image to Storage
            $file->storeAs($path, $fileName);
            $validatedData['photo'] = $fileName;
        }

        ListToko::where('id', $id)->update($validatedData);

        return Redirect::route('list-toko.index')->with('success', 'Supplier has been updated!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        /**
         * Delete photo if exists.
         */
        $listtoko = ListToko::findOrFail($id);
        if ($listtoko->photo) {
            Storage::delete('public/listtoko/' . $listtoko->photo);
        }

        ListToko::destroy($listtoko->id);

        return Redirect::route('list-toko.index')->with('success', 'Supplier has been deleted!');
    }

    public function changeStatus(Request $request, $id)
    {
        $listtoko = ListToko::findOrFail($id);

        // Ubah status list toko
        $listtoko->status_id = $request->input('status') ? 1 : 2;

        // Simpan perubahan
        $listtoko->save();

        // Redirect kembali dengan pesan sukses
        return redirect()->route('list-toko.index')->with('success', 'Status toko telah diperbarui!');
    }
}
