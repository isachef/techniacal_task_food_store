import 'package:tt_food_shop/models/food_model.dart';
import 'package:tt_food_shop/screens/main_screen/cubit/food_provider.dart';

class FoodRepository{
  FoodProvider foodProvider=FoodProvider();

  Future<FoodModel> getFood(){
    return foodProvider.getFood();
  }
}