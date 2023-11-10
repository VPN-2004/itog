<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNewsTable extends Migration
{
    public function up()
{
Schema::create('news', function (Blueprint $table) {
$table->id();
$table->string('title');
$table->text('content');
$table->date('date');
$table->timestamps();
$table->tipe('tipe');
});
}

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('news');
    }
}
