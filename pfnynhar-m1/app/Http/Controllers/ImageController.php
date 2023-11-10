<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Auth;

class ImageController extends Controller
{
    protected $fillable = ['user_id', 'image'];
    public function index(Request $request)
    {
        $filter = $request->input('filter');

// Получите выбранные категории или все категории, если фильтр не выбран
$categories = $filter ? Category::with('descendants')
->where('name', $filter)
->orWhereHas('ancestors', function ($query) use ($filter) {
$query->where('name', $filter);
})
->get()
: Category::with('descendants')->get();


// Получите изображения, связанные с выбранными категориями или все изображения
$images = $filter ? Image::whereIn('category_id', $categories->pluck('id'))->get()
: Image::all();

return view('gallery', compact('images', 'categories'));
}
        

    public function store(Request $request)
    {
        $this->validate($request, [
            'image' => 'required',
            ]);
            
            $images = $request->image;
            
            foreach ($images as $image) {
            $image_new_name = time() . $image->getClientOriginalName();
            $image->move('images', $image_new_name);
            
            $post = new Image;
            $post->user_id = Auth::user()->id;
            $post->image = 'images/' . $image_new_name;
            $post->category_id = $request->input('category_id'); // Установить значение category_id
            $post->save();
            }
            
            session()->flash('success', 'Изображение загружено');
            return redirect('/gallery')->with('categories', Category::all());
            }
    public function destroy($id)
    {
    $image = Image::find($id);
    
    if ($image) {
    // Удалите файл изображения, если необходимо
    if (Storage::exists($image->image)) {
    Storage::delete($image->image);
    }
    
    // Удалите запись из базы данных
    $image->delete();
    
    // Показать флеш-сообщение об успешном удалении
    
    }
    
    // Перенаправить пользователя на другую страницу
    return redirect('/gallery');
    }
}
