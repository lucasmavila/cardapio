// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_page.dart';
import 'package:cardap/modules/account/account_page.dart';
import 'package:cardap/modules/home/home_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/menuItemDetails/menu_item_details_page.dart';
import 'package:cardap/modules/orders/orders_page.dart';
import 'package:cardap/modules/splash/splash_page.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cardap",
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(
            store: ModalRoute.of(context)!.settings.arguments as StoreModel),
        "/menu": (context) => MenuPage(),
        "/cart": (context) => CartPage(
            cartController:
                ModalRoute.of(context)!.settings.arguments as CartController),
        "/orders": (context) => OrdersPage(),
        "/account": (context) => AccountPage(),
        "/menuItemDetails": (context) => MenuItemDetailsPage(
            itemSelected:
                ModalRoute.of(context)!.settings.arguments as ItemModel),
      },
    );
  }
}
