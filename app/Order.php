<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $guarded = [];

    public function history()
    {
      return $this->hasMany(History::class);
    }
}
