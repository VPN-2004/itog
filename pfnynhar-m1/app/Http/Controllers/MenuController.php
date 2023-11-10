<?php

namespace App\Http\Controllers;


use CodexShaper\Menu\Models\Menu;
use CodexShaper\Menu\Models\MenuItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

    class MenuController extends Controller

    {
    public function create()
    {
    $menu = Menu::create(['name' => 'Мой новый сайт']);
    
    // Дополнительный код, если необходимо
    
    return view('menu.create', compact('menu'));
    }
    
    public function edit($menu)
    {
    $menu = Menu::find($menu);
    
    // Дополнительный код, если необходимо
    
    return view('menu.edit', compact('menu'));
    }  
    
    public function update(Request $request, $id)
{
$menu = Menu::findOrFail($id);

// Валидация данных из формы
$validatedData = $request->validate([
'name' => 'required',
// Дополнительные правила валидации, если необходимо
]);

// Обновление информации о меню
$menu->update([
'name' => $validatedData['name'],
// Дополнительные поля, если необходимо
]);

// Дополнительный код, если необходимо

return redirect()->route('menu.edit', $menu->id)->with('success', 'Информация о меню успешно обновлена');

}

public function createSite()
{
// Генерация имени представления
$name = 'my-new-site';
$viewName = Str::kebab($name);

// Создание представления
$viewPath = resource_path('views/' . $viewName . '.blade.php');
if (!File::exists($viewPath)) {
File::put($viewPath, '');
}

// Добавление маршрута в web.php
$route = "Route::view('/$viewName', '$viewName');";
File::append(base_path('routes/web.php'), $route . PHP_EOL);

// Открытие представления в текстовом редакторе
Artisan::call('open:view', ['name' => $viewName]);

return redirect()->to("/$viewName");
}

}

