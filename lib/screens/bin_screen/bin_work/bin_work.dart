import 'package:flutter/foundation.dart';
import 'package:tt_food_shop/models/dish_model.dart';

class Cart extends ChangeNotifier {
   List<BinProduct> _products = [];

  List<BinProduct> get products => _products;

  void addToCart(BinProduct dish) {

    _products.add(dish);
    notifyListeners();
  }

  void removeFromCart(BinProduct dish) {
    _products.remove(dish);
    notifyListeners();
  }
}

class BinProduct{
  final Dish dish;
  int index;

  BinProduct(this.dish,this.index);
}