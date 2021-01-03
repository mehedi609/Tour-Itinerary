<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class History extends Model
{
  protected $guarded = [];

  public function post()
  {
    return $this->belongsTo(Order::class);
  }
}
