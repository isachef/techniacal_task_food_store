import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt_food_shop/screens/bottom_bar_screen.dart';
import 'package:tt_food_shop/screens/category_screen/category_screen.dart';
import 'package:tt_food_shop/screens/main_screen/cubit/food_cubit.dart';
import 'package:tt_food_shop/widgets/main_widgets/main_widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  FoodCubit cubit = FoodCubit();

  @override
  void initState() {
    cubit.fetchFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomNavigationBar(context,0),
      appBar: CustomAppBar(),
      body: BlocBuilder<FoodCubit, FoodState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is FoodFetchedState) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: state.foodModel.categories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(title: state.foodModel.categories[index].name)));
                  },
                  child: Stack(children: [
                    Container(
                      height: 148.h,
                      width: 1.sw,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            state.foodModel.categories[index].imageUrl,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12.h,
                      left: 16.w,
                      child: Text(state.foodModel.categories[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.sp)),
                    )
                  ]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 8.h,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );

  }
}

