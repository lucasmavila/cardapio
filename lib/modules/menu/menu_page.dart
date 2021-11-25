// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/menu/menu_item/menu_list_widget.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';

import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final List<ItemModel>? menu;
  const MenuPage({Key? key, this.menu}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        HeaderWidget(title: "Cardápio"),
        SingleChildScrollView(
          child: MenuListWidget(menu: widget.menu),
        )
      ]),
    );
  }
}
