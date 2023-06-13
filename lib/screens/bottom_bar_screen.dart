import 'package:flutter/material.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_screen.dart';
import 'package:tt_food_shop/screens/category_screen/category_screen.dart';
import 'package:tt_food_shop/screens/main_screen/main_screen.dart';

// class BottomBarScreen extends StatefulWidget {
//   const BottomBarScreen({Key? key, this.currentTab}) : super(key: key);
//   final int? currentTab;
//
//   @override
//   State<BottomBarScreen> createState() => _BottomBarScreenState();
// }
//
// class _BottomBarScreenState extends State<BottomBarScreen> {
//   int selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }
//
//   // final List _widgetOptions = [
//   //   const MainScreen(),
//   //   const CategoryScreen(),
//   //   // const MainScreen(),
//   //   // const MainScreen(),
//   //
//   //   // const LocationScreen(),
//   //   // const EpisodeScreen(),
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: _widgetOptions.elementAt(selectedIndex),
//       // bottomNavigationBar: buildBottomNavigationBar(context),
//     );
//   }
//
// }
BottomNavigationBar buildBottomNavigationBar(BuildContext context,  final int selectedIndex) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/main.png',
          width: 24,
          color: selectedIndex == 0 ? Colors.blue : const Color(0xffA5A9B2),
        ),
        label: 'Главная',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/icons/search-normal.png",
          width: 24,
          color: selectedIndex == 1 ? Colors.blue : const Color(0xffA5A9B2),
        ),
        label: 'Поиск',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/icons/bin.png",
          width: 24,
          color: selectedIndex == 2 ? Colors.blue : const Color(0xffA5A9B2),
        ),
        label: 'Корзина',
      ),
      BottomNavigationBarItem(
        icon: Image.asset(
          "assets/icons/account.png",
          width: 24,
          color: selectedIndex == 3 ? Colors.blue : const Color(0xffA5A9B2),
        ),
        label: 'Аккаунт',
      ),
    ],
    currentIndex: selectedIndex,
    onTap: (index) {
        switch (index) {
          // case 0:
          //   Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       "mainSreen",
          //           (Route route) => true);
          //   break;
          // case 1:
          //   Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       "categoryScreen",
          //           (Route route) => false);
          //   break;
          // case 2:
          //   Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       "mainSreen",
          //           (Route route) => false);
          //   break;
          // case 3:
          //   Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       "mainSreen",
          //           (Route route) => false);
          //   break;
          case 0: Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (_, __, ___) => MainScreen()), ModalRoute.withName("/mainSreen")); break;
          case 2: Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (_, __, ___) => BinScreen()), ModalRoute.withName("/binScreen")); break;
        }

    },
    type: BottomNavigationBarType.fixed,
    iconSize: 40,
  );
}
