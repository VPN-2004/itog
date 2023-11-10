<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function index()
{
$news = News::latest()->paginate(10);
return view('news.index', compact('news'));
}
public function product(Request $data){
    $item = News::query()->where('id', '=', $data->id)->get();
    return view('product', ['product' => $item]);
}

public function edit($id)
{
$news = News::findOrFail($id);

return view('newsedit', compact('news'));
}

public function update(Request $request, $id)
{
    $news = News::findOrFail($id);

    $request->validate([
    'title' => 'required',
    'content' => 'required',
    'fullcontent' => 'required',
    ]);
    
    $news->update([
        'title' => $request['title'],
        // Дополнительные поля, если необходимо
        ]);
        $news->update([
        'content' => $request['content'],
        // Дополнительные поля, если необходимо
        ]);
        $news->update([
        'fullcontent' => $request['fullcontent'],
        // Дополнительные поля, если необходимо
        ]);
    // $news->title = $request->input('title');
    // $news->content = $request->input('content');
    // $news->fullcontent = $request->input('fullcontent'); // Предполагаем, что у вас есть свойство `fullcontent` в модели `News`
    
    // Сохранение остальных полей
    
    $news->save();
    
    return redirect()->route('news.index')->with('success', 'Информация о новости обновлена.');
    }

}