@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center"> <div class="col-md-8"> <div class="card"><br>
        <div class="card-header">Загрузить изображение</div><br>
        <div class="card-body"><br>
        
        <form action="/image" enctype="multipart/form-data" method="POST"><br>
            @csrf<br> @method('PUT')<br>
            <select class="form-control" id="category_id" name="category_id">      
            <option value="">Категория</option>         
        <!-- Отобразить список категорий, доступных для фильтрации -->               
        @foreach ($categories as $category)                   
        <option value="{{ $category->id }}">{{ $category->name }}</option>               
        @endforeach           
        </select><br>
            <div class="form-group"><br>
            <input type="file" name="image[]" class="form-control-image" multiple="" accept="image/*"><br>
    </div><br>
    <input type="submit" value="Загрузить" class="btn btn-primary"><br>
    </form>
    <br>
</div>
<br>
</div>
</div>
</div>
</div>
@endsection