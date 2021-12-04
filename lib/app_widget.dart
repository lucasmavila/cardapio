// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_page.dart';
import 'package:cardap/modules/account/account_page.dart';
import 'package:cardap/modules/home/home_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/menu/menu_item_details_page.dart';
import 'package:cardap/modules/orders/orders_page.dart';
import 'package:cardap/modules/splash/splash_page.dart';
import 'package:cardap/shared/auth/store_controller.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => StoreController(context))
      ],
      child: MaterialApp(
        title: "Cardap",
        theme: ThemeData(
            primaryColor: AppColors.primary, primarySwatch: Colors.orange),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(),
          "/menu": (context) => MenuPage(),
          "/cart": (context) => CartPage(),
          "/orders": (context) => OrdersPage(),
          "/account": (context) => AccountPage(),
          "/menuItemDetails": (context) => MenuItemDetailsPage(),
        },
      ),
    );
  }
}
