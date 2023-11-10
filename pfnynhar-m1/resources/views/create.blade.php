@extends('layouts.app')
@section('content')
    <div class="container">
        <h1 class="text-center mb-4">Добавление товара</h1>
        <div class="card">
         <div class="card-body">
        <div class="d-flex gap-1 justify-content-around">
            <div class="card w-25 shadow">
                <div class="card-header">Добавить товар</div>
                <div class="card-body">
                    <form action="create_add">
                        <label style="margin-left: 1rem" class="mb-3" for="">Название</label>
                        <input type="text" class="form-control" name="title">
                        <label class=" m-2" for="">Изображение</label>
                        <?php $path =  '/public/img'; ?>
                            <select type="text" name="img" class="form-control">
                                    <option value=""></option>
                                    <?php 
                                    $img ='img/';
                                    foreach(scandir($_SERVER['DOCUMENT_ROOT'].$path) as $obj) {
                                        if ($obj == '.' || $obj == '..') {
                                            continue;
                                        } elseif (!is_dir($path . '/' . $obj)) {
                                            echo '<option value="img/'  . $obj . '">' .$img . $obj . '</option>';
                                        }		
                                    } 
                                ?>
                            </select>

                        <label class=" m-2" for="">Цена</label>
                        <input type="number" class="form-control" name="price" placeholder="3500">
                        <label class=" m-2" for="">Состав</label>
                        <input type="text" class="form-control" name="Sostav">
                        <label class=" m-2" for="">Вес</label>
                        <input type="text" class="form-control" name="Bec">
                        <label class=" m-2" for="">Категория</label>
                        <input type="number" class="form-control" name="category" placeholder="2">
                        <button class="btn btn-primary mt-3">Добавить</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
