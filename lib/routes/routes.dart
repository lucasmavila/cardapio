import 'package:cardap/modules/menu/menu_item_details_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/page/home_page.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/modules/restaurant/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  late final router = GoRouter(
    initialLocation: '/',
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: '/',
        redirect: (state) => '/exemplo01',
        builder: (context, state) =>
            SplashPage(restaurantId: state.params['restaurantId']!),
      ),
      GoRoute(
        path: '/:restaurantId',
        builder: (context, state) => SplashPage(
          restaurantId: state.params['restaurantId']!,
        ),
        redirect: (state) => '/${state.params['restaurantId']}/menu',
        routes: [
          GoRoute(
            path: 'menu',
            name: 'menuPage',
            builder: (context, state) => HomePage(
              restaurantId: state.params['restaurantId']!,
              pageIndex: 0,
            ),
            routes: [
              GoRoute(
                path: 'category/:categoryId/item/:itemid',
                name: 'menuItemDetailsPage',
                builder: (context, state) => MenuItemDetailsPage(
                  restaurantId: state.params['restaurantId']!,
                  categoryId: state.params['categoryId']!,
                  itemId: state.params['itemid']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'cart',
            name: 'cartPage',
            builder: (context, state) => HomePage(
              restaurantId: state.params['restaurantId']!,
              pageIndex: 1,
            ),
          ),
          GoRoute(
            path: 'orders',
            name: 'ordersPage',
            builder: (context, state) => HomePage(
              restaurantId: state.params['restaurantId']!,
              pageIndex: 2,
            ),
          ),
          GoRoute(
            path: 'account',
            name: 'accountPage',
            builder: (context, state) => HomePage(
              restaurantId: state.params['restaurantId']!,
              pageIndex: 3,
            ),
          ),
        ],
      ),
    ],
  );
}
