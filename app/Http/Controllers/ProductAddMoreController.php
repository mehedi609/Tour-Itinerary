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
      'addmore.*.type' => 'required',
      'addmore.*.person' => 'required',
      'addmore.*.price' => 'required',
    ]);
//    dd($request);

    DB::beginTransaction();

    try {
      $total = 0;
      $order = new Order();
      $order->name = $request->user_name;
      $order->address = $request->user_address;
      $order->total = $total;
      $order->save();
      foreach ($request->addmore as $key => $value) {
        $name = $value['name'];
        $type = $value['type'];
        $person = $value['person'];
        $price = (int)$value['price'];

        $history = new History();
        $history->package_name = $name;
        $history->paying_person = $person;
        $history->package_type = $type;
        $history->package_price = $price;

        $order->history()->save($history);

        $total += $price;
      }
      $order = Order::find($order->id);
      $order->total = $total;
      $order->save();

      DB::commit();
      return back()->with('success', 'Record Created Successfully.');
    } catch (\Exception $e) {
      DB::rollback();
      return back()->with('warning', 'Something went wrong. Try again!');
    }
  }

  public function getPriceOnChange(Request $request): \Illuminate\Http\JsonResponse
  {
//    dd($request);
    $name = $request->package_name;
    $person = $request->package_person;
    $type = $request->package_type;

    $price = DB::table('packages')
      ->select('price')
      ->where('name', $name)
      ->where('person', $person)
      ->where('type', $type)
      ->get();

    return response()->json($price[0]->price);
  }
}
