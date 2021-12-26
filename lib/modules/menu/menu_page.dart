// ignore_for_file: prefer_const_constructors

import 'package:cardap/modules/menu/menu_list_widget.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/widgets/confirm_button/confirm_button_widget.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:cardap/modules/page/app_header.dart';
import 'package:cardap/modules/page/botton_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({
    Key? key,
  }) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: const [
          HeaderWidget(title: "Cardápio"),
          SingleChildScrollView(
            child: MenuListWidget(),
          ),
        ],
      ),
    );
  }
}
