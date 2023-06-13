import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_work/bin_work.dart';
import 'package:tt_food_shop/screens/bottom_bar_screen.dart';
import 'package:tt_food_shop/widgets/bin_widgets/bin_widgets.dart';
import 'package:tt_food_shop/widgets/main_widgets/main_widgets.dart';

class BinScreen extends StatefulWidget {
  const BinScreen({Key? key}) : super(key: key);

  @override
  State<BinScreen> createState() => _BinScreenState();
}

class _BinScreenState extends State<BinScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final products = cart.products;

    return Scaffold(
      appBar: const CustomAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(context, 2),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemTile(
                  item: products[index],
                  onTapMinus: () {
                    if (products[index].index > 0) {
                      products[index].index--;
                      if (products[index].index == 0) {
                        products.removeAt(index);
                      }
                      setState(() {});
                    }
                  },
                  onTapPlus: () {
                    setState(
                      () {
                        products[index].index++;
                      },
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: 1.sw,
            height: 48.h,
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3364E0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () {},
              child: Text('Оплатить ${findingSum(products)} '),
            ),
          ),
        ],
      ),
    );
  }
}

int findingSum(List<BinProduct> products) {
  int sum = 0;
  for (int i = 0; i < products.length; i++) {
    sum += products[i].dish.price * products[i].index;
  }
  return sum;
}
