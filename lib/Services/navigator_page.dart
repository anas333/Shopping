import 'package:flutter/material.dart';
import 'package:shopping/Model/shirt_model.dart';
import 'package:shopping/floor/entity/cart_clothes.dart';

class NavNewPageService extends ChangeNotifier {
  Shirts? _selectedshirts;
  List<Clothes>? _clothes;

  Shirts? get selectedShirt => _selectedshirts;
  set selectedShirt(Shirts? value) {
    _selectedshirts = value;
    notifyListeners();
  }

  List<Clothes>? get selectedCart => _clothes;
  set selectedCart(List<Clothes>? value) {
    _clothes = value;
    notifyListeners();
  }
}
