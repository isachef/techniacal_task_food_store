import 'package:dio/dio.dart';
import 'package:tt_food_shop/helpers/api_requester.dart';
import 'package:tt_food_shop/models/food_model.dart';

class FoodProvider {
  ApiRequester apiRequester = ApiRequester();

  Future<FoodModel> getFood() async {
    Response response = await apiRequester
        .toGet('https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54');
    FoodModel foodModel;

    try {
      if (response.statusCode == 200) {
        foodModel=FoodModel.fromJson(response.data["сategories"]);

        return foodModel;
      } else {
        print('error status code');
        throw 'error';
      }
    } catch (e) {
      print("error food: $e");
      throw 'error';
    }
  }
}
