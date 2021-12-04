// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/menu/menu_list_widget.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';

import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_literals_to_create_immutables
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: const [
        HeaderWidget(title: "Cardápio"),
        SingleChildScrollView(
          child: MenuListWidget(),
        )
      ]),
    );
  }
}
