part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryFetchedState extends CategoryState {
  final DishModel dishModel;

  CategoryFetchedState({required this.dishModel});
}

class CategoryLoadingState extends CategoryState {}

class CategoryErrorState extends CategoryState {}

