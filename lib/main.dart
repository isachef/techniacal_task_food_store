import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_screen.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_work/bin_work.dart';
import 'package:tt_food_shop/screens/bottom_bar_screen.dart';
import 'package:tt_food_shop/screens/category_screen/category_screen.dart';
import 'package:tt_food_shop/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
          create: (context) => Cart(),
          child: MaterialApp(
            color: Colors.white,

            title: 'Food store',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MainScreen(),
            initialRoute:"mainScreen" ,
            routes: {
              "mainScreen":(context)=>MainScreen(),
          "binScreen":(context)=>BinScreen(),
          // "bottomBar":(context)=>BottomBarScreen(),
            },
          ),
        );
      },
    );
  }
}
