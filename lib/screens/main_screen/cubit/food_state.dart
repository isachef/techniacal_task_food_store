part of 'food_cubit.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodFetchedState extends FoodState {
  final FoodModel foodModel;

  FoodFetchedState({required this.foodModel});
}

class FoodLoadingState extends FoodState {}


