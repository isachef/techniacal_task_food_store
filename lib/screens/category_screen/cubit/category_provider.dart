import 'package:dio/dio.dart';
import 'package:tt_food_shop/helpers/api_requester.dart';
import 'package:tt_food_shop/models/dish_model.dart';

class CategoryProvider {
  final ApiRequester _apiRequester = ApiRequester();

  Future<DishModel> getDishes() async {
      Response response = await _apiRequester.toGet(
          'https://run.mocky.io/v3/c7a508f2-a904-498a-8539-09d96785446e');
       DishModel dishModel;

    try {
      if (response.statusCode == 200) {
        dishModel = DishModel.fromJson(response.data["dishes"]);

        return dishModel;
      } else {
        print('error status code');
        throw 'error';
      }
    } catch (e) {
      print('error category: $e');
      throw Exception(e);
    }
  }
}
