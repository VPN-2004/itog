<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Редиректы
Route::get('/', function () {return redirect('about');});
Route::get('/home', function () {return redirect('about');});

//Авторизация
Auth::routes();

//Главные страницы

Route::get('/dowimage', [App\Http\Controllers\MainController::class, 'dow'])->name('dowimage');
Route::put('/image', [App\Http\Controllers\ImageController::class, 'store']);
Route::delete('/image/{id}', [App\Http\Controllers\ImageController::class, 'destroy'])->name('image.destroy');
//Видно только для администратора
Route::get('/create', [App\Http\Controllers\CreateController::class, 'create'])->middleware('isAdmin')->name('create');
Route::get('/create_add', [App\Http\Controllers\CreateController::class, 'add'])->name('create');
Route::get('/editing', [App\Http\Controllers\EditingController::class, 'editing'])->name('editing');
Route::get('/editing_red', [App\Http\Controllers\EditingController::class, 'red'])->name('editing');

//Админ панель
Route::get('/admin', [App\Http\Controllers\AdminController::class, 'index'])->middleware('isAdmin')->name('admin');
Route::get('/admin_add', [App\Http\Controllers\AdminController::class, 'add'])->middleware('isAdmin');
Route::get('/admin_del', [App\Http\Controllers\AdminController::class, 'del'])->middleware('isAdmin');
Route::get('/admin_red', [App\Http\Controllers\AdminController::class, 'red'])->middleware('isAdmin');

Route::get('/profile', [App\Http\Controllers\ProfileController::class, 'index'])->name('profile');
Route::get('/editingprofile', [App\Http\Controllers\ProfileEditingController ::class, 'editingprofile'])->name('editingprofile');
Route::get('/editingprofile_red', [App\Http\Controllers\ProfileEditingController ::class, 'red'])->name('editingprofile');

//Корзина
Route::get('/cart', [App\Http\Controllers\CartController::class, 'index']);
Route::get('/cart_add', [App\Http\Controllers\CartController::class, 'add']);
Route::get('/cart_del', [App\Http\Controllers\CartController::class, 'del']);
Route::get('/cart_fulldel', [App\Http\Controllers\CartController::class, 'fulldel']);

//Заказы
Route::get('/order_add', [App\Http\Controllers\OrderController::class, 'add'])->middleware('password.confirm')->name('order');
Route::get('/news', [App\Http\Controllers\NewsController::class, 'index'])->name('news.index');
Route::get('/newspage', [App\Http\Controllers\NewsController::class, 'product'])->name('product');
Route::get('/news/{id}/edit', [App\Http\Controllers\NewsController::class, 'edit'])->name('newsedit');
Route::put('/news/{id}', [App\Http\Controllers\NewsController::class, 'update'])->name('newsupdate');

MenuBuilder::routes();

Route::get('/about', [App\Http\Controllers\MainController::class, 'about'])->name('about');
Route::get('/gallery', [App\Http\Controllers\ImageController::class, 'index'])->name('gallery.index');
Route::get('/contacts', [App\Http\Controllers\MainController::class, 'contacts'])->name('contacts');
Route::get('/cart', [App\Http\Controllers\CartController::class, 'index']);
Route::get('/logout', [App\Http\Controllers\AuthController::class, 'logout'])->name('logout');

Route::get('/menu/create', [App\Http\Controllers\MenuController::class, 'create'])->name('menu.create');
Route::get('/menu/edit/{menu}', [App\Http\Controllers\MenuController::class, 'edit'])->name('menu.edit');
Route::put('/menu/update/{id}', [App\Http\Controllers\MenuController::class, 'update'])->name('menu.update');