<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePackagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('packages', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->enum('name', ['Package 1', 'Package 2', 'Package 3']);
            $table->enum('person', ['02-00 PAX', '03-04 PAX', '05-06 PAX', '07-08 PAX', '09-10 PAX']);
            $table->enum('type', ['Standard', 'Deluxe', 'Luxury']);
            $table->integer('price');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('packages');
    }
}
