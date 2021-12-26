// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/page/botton_navigation_controller.dart';
import 'package:cardap/routes/routes.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
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
        ChangeNotifierProvider(create: (_) => RestaurantController()),
      ],
      child: MaterialApp.router(
        title: "Cardap",
        theme: ThemeData(
            primaryColor: AppColors.primary, primarySwatch: Colors.orange),
        routeInformationParser: AppRoutes().router.routeInformationParser,
        routerDelegate: AppRoutes().router.routerDelegate,
      ),
    );
  }
}
