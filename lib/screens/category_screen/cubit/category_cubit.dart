import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tt_food_shop/models/dish_model.dart';
import 'package:tt_food_shop/screens/category_screen/cubit/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final CategoryRepository _categoryRepository = CategoryRepository();
  late DishModel _dishModel;

  Future<void> fetchDishes() async {

    try {
      emit(CategoryLoadingState());

      _dishModel = await _categoryRepository.getDishes();

      emit(CategoryFetchedState(dishModel: _dishModel));
    } catch (e) {
      print('category cubit error: $e');
    }
  }

  Future<void> sortDishes(String teg)async {
    DishModel sortedDishModel;
    List<Dish> sortedDish=[];


    try{
      // sortedDishes.dishes.map((e) => if(e.tegs!.contains(teg)));
      for(int i=0;i<_dishModel.dishes.length;i++){
        if(_dishModel.dishes[i].tegs!.contains(teg)){
          sortedDish.add(_dishModel.dishes[i]);
        }
    }
      sortedDishModel=DishModel(dishes: sortedDish);
      emit(CategoryFetchedState(dishModel: sortedDishModel));
    }catch(e){
      print(e);
      throw e;
    }
  }
}
