import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tt_food_shop/models/dish_model.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_work/bin_work.dart';
import 'package:tt_food_shop/screens/bottom_bar_screen.dart';
import 'package:tt_food_shop/screens/category_screen/cubit/category_cubit.dart';
import 'package:tt_food_shop/widgets/category_widgets/category_widgets.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with TickerProviderStateMixin {
  late CategoryCubit _cubit;
  late TabController tabController;
  int categorySelected = 0;
  static const List<String> _categories = [
    'Все меню',
    'Салаты',
    'С рисом',
    'С рыбой'
  ];
  List<Dish> bin = [];
  late final cart;

  @override
  void initState() {
    _cubit = CategoryCubit();
    cart = Provider.of<Cart>(context, listen: false);
    _cubit.fetchDishes();
    tabController =
        TabController(length: _categories.length, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() => categorySelected = tabController.index);
        _cubit.sortDishes(_categories[categorySelected]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context, 0),
      appBar: CategoryAppBar(widget: widget),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is CategoryLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CategoryFetchedState) {
            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 35.h,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        for (int index = 0; index < _categories.length; index++)
                          (Tab(
                            child: AnimatedContainer(
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: categorySelected == index
                                        ? const Color(0xff3364E0)
                                        : const Color(0xffF8F7F5),
                                    width: 1),
                              ),
                              duration: const Duration(milliseconds: 200),
                              child: Center(
                                child: Text(
                                  _categories[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: categorySelected == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      ],
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      labelPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      indicatorWeight: 0,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xff3364E0),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Category_grid_view(
                      cart: cart,
                      dishModel: state.dishModel,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(color: Colors.cyan);
        },
      ),
    );
  }
}


