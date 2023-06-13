import 'package:tt_food_shop/models/dish_model.dart';
import 'package:tt_food_shop/screens/category_screen/cubit/category_provider.dart';

class CategoryRepository{
  CategoryProvider categoryProvider=CategoryProvider();

  Future<DishModel> getDishes(){
    return categoryProvider.getDishes();
  }
}