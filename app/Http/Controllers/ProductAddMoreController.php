<?php

namespace App\Http\Controllers;

use App\History;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductAddMoreController extends Controller
{
  public function addMore()
  {
    return view("addMore");
  }

  public function addMoreProduct(Request $request)
  {
    $request->validate([
      'user_name' => 'required',
      'user_address' => 'required',
      'addmore.*.name' => 'required',
      'addmore.*.qty' => 'required',
      'addmore.*.price' => 'required',
    ]);

    $total = 0;

    $order = new Order();
    $order->name = $request->user_name;
    $order->address = $request->user_address;
    $order->total = $total;
    $order->save();

//    dd($order);

//    dd($request);

    foreach ($request->addmore as $key => $value) {
      $name = $value['name'];
      $type = $value['type'];
      $person = $value['person'];

      $history = new History();
      $history->package_name = $name;
      $history->paying_person = $person;
      $history->package_type = $type;

      $order->history()->save($history);

      $price = DB::table('packages')
        ->select('price')
        ->where('name', $name)
        ->where('person', $person)
        ->where('type', $type)
        ->get();

//      dd($price[0]->price);
      $total += $price[0]->price;
    }

    $order = Order::find($order->id);
    $order->total = $total;
    $order->save();

    return back()->with('success', 'Record Created Successfully.');
  }
}
