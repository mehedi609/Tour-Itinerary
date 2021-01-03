<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductStock extends Model
{
  protected $fillable = ['name', 'qty', 'price'];
}
