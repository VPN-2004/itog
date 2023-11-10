@extends('layouts.app')
@section('content')
    <div class="container">
        <h1 class="text-center mb-4">Добавление товара</h1>
        <div class="card">
         <div class="card-body">
        <div class="d-flex gap-1 justify-content-around">
            <div class="card w-25 shadow">
                <form method="POST" action="{{ route('menu.update', $menu->id) }}"><br>    @csrf<br>    @method('PUT')<br><br>    <div class="form-group"><br>        <label for="name">Название меню</label><br>        <input type="text" name="name" id="name" value="{{ old('name', $menu->name) }}" class="form-control" required=""><br>    </div><br><br>    <!-- Дополнительные поля формы, если необходимо --><br><br>    <button type="submit" class="btn btn-primary">Обновить меню</button><br></form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
