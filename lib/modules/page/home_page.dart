import 'package:cardap/modules/account/account_page.dart';
import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/orders/orders_page.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/modules/testenavigation/fake_home_page.dart';
import 'package:cardap/modules/testenavigation/fake_menu_item_page.dart';
import 'package:cardap/modules/testenavigation/fake_menu_page.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/modules/page/app_header.dart';
import 'package:cardap/modules/page/botton_bar.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {Key? key, required this.restaurantId, required this.pageIndex})
      : super(key: key);
  final String restaurantId;
  final int pageIndex;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String>? _restaurantReady;
  @override
  Widget build(BuildContext context) {
    final restaurantNotifier = Provider.of<RestaurantController>(context);
    _restaurantReady = restaurantNotifier.loadFromApiUrl(widget.restaurantId);

    return FutureBuilder<String>(
      future: _restaurantReady,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: AppBarHeader(),
              ),
            ),
            body: [
              const MenuPage(),
              const CartPage(),
              const FakeMenuItemPage(),
              const FakeMenuPage()
            ][widget.pageIndex],
            bottomNavigationBar: AppBottonNavigation(
                pageIndex: widget.pageIndex, restaurantId: widget.restaurantId),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
