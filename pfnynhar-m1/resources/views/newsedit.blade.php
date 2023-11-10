@extends('layouts.app')
@section('content')

<form method="POST" action="{{ route('newsupdate', $news->id) }}"><br>
    @csrf
    @method('PUT')
    <div class="form-group"><br>
        <label for="title">Заголовок</label><br>
        <input type="text" id="title" name="title" value="{{ $news->title }}" class="form-control"><br>
    </div><br>
    <div class="form-group"><br>
        <label for="content">МинКонтент</label><br>
        <textarea id="content" name="content" rows="4" class="form-control">{{ $news->content }}</textarea><br>
    </div><br>
    <div class="form-group"><br>
        <label for="fullcontent">Полный Контент</label><br>
        <textarea id="fullcontent" name="fullcontent" rows="4" class="form-control">{{ $news->fullcontent }}</textarea><br>
    </div><br>
    <!-- Добавьте остальные поля формы --><br>    
    <button type="submit" class="btn btn-primary">Сохранить</button><br>
</form>
@endsection