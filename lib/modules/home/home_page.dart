// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_page.dart';
import 'package:cardap/modules/account/account_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/orders/orders_page.dart';
import 'package:cardap/shared/auth/store_controller.dart';

import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/widgets/navigation/app_header.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  bool logged = false;

  void _handlePageSelection(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: AppBarHeader())),
      body: [
        MenuPage(),
        CartPage(),
        OrdersPage(),
        AccountPage()
      ][_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.body,
        unselectedItemColor: AppColors.stroke,
        unselectedLabelStyle: AppTextStyles.body,
        showUnselectedLabels: true,
        elevation: 20,
        iconSize: 30,
        currentIndex: _selectedPageIndex,
        onTap: _handlePageSelection,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_rounded),
            label: "Cardápio",
          ),
          BottomNavigationBarItem(
              icon: cartController.getSavedItemsLength() == 0
                  ? Icon(Icons.shopping_cart_rounded)
                  : Stack(
                      children: <Widget>[
                        Icon(Icons.shopping_cart_rounded),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(6)),
                              constraints:
                                  BoxConstraints(minHeight: 12, minWidth: 12),
                              child: Text(
                                  cartController
                                      .getSavedItemsLength()
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                  textAlign: TextAlign.center),
                            ))
                      ],
                    ),
              label: "Carrinho"),
          BottomNavigationBarItem(
              icon: Icon(Icons.all_inbox_rounded), label: "Pedidos"),
          BottomNavigationBarItem(
              icon: logged
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network("https://github.com/lucasmavila.png",
                          height: 30),
                    )
                  : Icon(Icons.person_rounded),
              label: "Conta"),
        ],
      ),
    );
  }
}
