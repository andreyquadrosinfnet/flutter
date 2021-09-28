import 'package:flutter/material.dart';
import 'package:flutter_app_aluguelbikes/models/bike.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bikes => [..._bikes];
  int get total => _bikes.length;

  double somaTotal = 0;

  void addBikes(Bike bike){
    _bikes.add(bike);
    notifyListeners();
  }

  void removeBikes(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }

  void sumPrice(Bike bike){
    somaTotal += bike.valor;
    notifyListeners();
  }

  void mPrice(Bike bike){
    somaTotal -= bike.valor;
    notifyListeners();
  }

}