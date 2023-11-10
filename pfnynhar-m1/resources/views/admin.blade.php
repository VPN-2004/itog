@extends('layouts.app')
@section('content')

    <div class="container">
        <h1 class="text-center mb-4">Панель администратора</h1>
        <div class="card">
<div class="card-header">Управление новостями</div>
            <div class="card-body">
        <div class="d-flex gap-1 justify-content-around">
            <div class="card w-25 shadow">
                <div class="card-header">Добавить новость</div>
                <div class="card-body">
                    <form action="admin_add">
                        <label style="margin-left: 1rem" class="mb-3" for="">Название</label>
                        <input type="text" class="form-control" name="title">
                        <label class=" m-2" for="">Тип</label>
                        <input type="text" class="form-control" name="tipe">
                        <label class=" m-2" for="">Контент</label>
                        <input type="text" class="form-control" name="content">
                        <label class=" m-2" for="">Полный Контент</label>
                        <input type="text" class="form-control" name="fullcontent">
                        <label class=" m-2" for="">Дата</label>
                        <input type="date" class="form-control" name="date">
                        <button class="btn btn-primary mt-3">Добавить</button>
                    </form>
                </div>
            </div>

            <div class="card w-25 shadow">
                <div class="card-header">Конструктор</div>
                <div class="card-body">
                   
                    @if(Auth::user())
                    @if((Auth::user()->isAdmin))
                <a class="btn btn-primary mt-3" href="{{url('admin/menus')}}">
                        Конструктор меню
                </a>
                    @endif
                    @endif
                </div>
            </div>

            <div class="card w-25 shadow">
                <div class="card-header">Удалить новость</div>
                <div class="card-body">
                    <form action="admin_del">
                        <label style="margin-left: 1rem" class="mb-3" for="">Название</label>
                        <input type="text" class="form-control" name="title">
                        <button class="btn btn-primary mt-3">Удалить</button>
                    </form>
                </div>
            </div>
        </div>
            </div>
        </div>

     
@endsection
