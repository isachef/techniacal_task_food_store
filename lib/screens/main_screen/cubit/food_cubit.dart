import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt_food_shop/models/food_model.dart';
import 'package:tt_food_shop/screens/main_screen/cubit/food_repository.dart';

part 'food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  FoodRepository foodRepository = FoodRepository();
  late FoodModel foodModel;

  Future<void> fetchFood() async {
    try {
      emit(FoodLoadingState());

      foodModel = await foodRepository.getFood();

      emit(FoodFetchedState(foodModel: foodModel));
    } catch (e) {
      print('food cubit error: $e');
    }
  }
}
