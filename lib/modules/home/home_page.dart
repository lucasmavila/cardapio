// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_page.dart';
import 'package:cardap/modules/account/account_page.dart';
import 'package:cardap/modules/menu/menu_page.dart';
import 'package:cardap/modules/orders/orders_page.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final StoreModel store;
  const HomePage({Key? key, required this.store}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;
  bool logged = false;
  final cartController = CartController();

  void _handlePageSelection(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: AppBar(
              backgroundColor: AppColors.background,
              actionsIconTheme: const IconThemeData.fallback(),
              elevation: 0,
              titleSpacing: 10,
              leadingWidth: 80,
              toolbarHeight: 80,
              leading: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: widget.store.logo != null
                            ? NetworkImage(widget.store.logo!)
                            : NetworkImage(
                                "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"))),
              ),
              title: Column(
                children: [
                  Text(widget.store.name,
                      style: AppTextStyles.mediumTitle,
                      textAlign: TextAlign.left),
                  Text(
                      "${widget.store.address.city}, ${widget.store.address.state}",
                      style: AppTextStyles.description,
                      textAlign: TextAlign.left)
                ],
              ),
              centerTitle: false),
        ),
      ),
      body: [
        MenuPage(menu: widget.store.menu),
        CartPage(cartController: cartController),
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
              icon: Icon(Icons.shopping_cart_rounded),
              label: "Carrinho (${cartController.order.items?.length})"),
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
