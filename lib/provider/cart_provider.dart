import 'package:flutter_app_aluguelbikes/models/bike.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/provider/cart_item.dart';

// class Cart{
//   List<Bike> _bikes = [];
//   List<Bike> get bikes => [...bikes];
//
//   int get total => _bikes.length;
//
//   void addBike(Bike bike){
//     _bikes.add(bike);
//   }
//   void removeBike(Bike bike){
//     _bikes.remove(bike);
//   }
// }

class CartProvider extends InheritedWidget{
  final CartItem cart = CartItem();

  CartProvider({Widget child}): super(child:child);
  static CartProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;

  }
}