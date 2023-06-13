import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt_food_shop/models/dish_model.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_work/bin_work.dart';
import 'package:tt_food_shop/screens/category_screen/category_screen.dart';

class Category_grid_view extends StatelessWidget {
  const Category_grid_view({
    super.key,
    required this.cart,
    required this.dishModel,
  });

  final Cart cart;
  final DishModel dishModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (109.w / 145.h),
          crossAxisCount: 3,
        ),
        itemCount: dishModel.dishes.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 446.h,
                      width: 343.w,
                      padding: EdgeInsets.all(16.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 232.h,
                                width: 311.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xffF8F7F5),
                                  borderRadius: BorderRadius.circular(10).r,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        dishModel.dishes[index].imageUrl ?? ''),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 16,
                                right: 72,
                                child: Container(
                                  height: 40.r,
                                  width: 40.r,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(
                                    Icons.favorite_border_outlined,
                                    size: 18.r,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 16,
                                right: 16,
                                child: Container(
                                  height: 40.r,
                                  width: 40.r,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8.r)),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 17.r,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            dishModel.dishes[index].name!,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  '${dishModel.dishes[index].price} ₽',
                                  style: TextStyle(
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  ' · ${dishModel.dishes[index].weight}',
                                  style: TextStyle(fontSize: 14.0),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 62.h,
                            child: ListView(children: [
                              Text(
                                dishModel.dishes[index].description!,
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ]),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            width: 1.sw,
                            height: 48.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff3364E0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.r))),
                              onPressed: () {
                                // bin.add(state.dishModel.dishes[index]);
                                final BinProduct dish =
                                BinProduct(dishModel.dishes[index], 1);
                                cart.addToCart(dish);
                                Navigator.pop(context);
                              },
                              child: Text('Добавить в корзину'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 109.w,
                  height: 110.h,
                  margin: EdgeInsets.only(bottom: 5.h),
                  decoration: BoxDecoration(
                      color: Color(0xffF8F7F5),
                      borderRadius: BorderRadius.circular(10).r,
                      image: DecorationImage(
                          image: NetworkImage(
                              dishModel.dishes[index].imageUrl ?? ''))),
                ),
                Text(
                  dishModel.dishes[index].name!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)),
                ),
              ],
            ),
          );
        });
  }
}

class CategoryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryAppBar({
    super.key,
    required this.widget,
  });

  final CategoryScreen widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
      title: Text(widget.title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              overflow: TextOverflow.visible)),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: CircleAvatar(
            maxRadius: 44.h,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}