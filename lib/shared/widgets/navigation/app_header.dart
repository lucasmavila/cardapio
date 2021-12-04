import 'package:cardap/shared/auth/store_controller.dart';
import 'package:cardap/shared/models/foodcamp/food_camp_store_model.dart';
import 'package:cardap/shared/models/store_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBarHeader extends StatefulWidget {
  const AppBarHeader({Key? key}) : super(key: key);

  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    final storeController = context.read<StoreController>();
    return AppBar(
        backgroundColor: AppColors.background,
        actionsIconTheme: const IconThemeData.fallback(),
        elevation: 0,
        titleSpacing: 10,
        leadingWidth: 80,
        toolbarHeight: 80,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: NetworkImage(storeController.getStoreLogo()))),
        ),
        title: Column(
          children: [
            Text(storeController.getStoreName(),
                style: AppTextStyles.mediumTitle, textAlign: TextAlign.left),
            Text(storeController.getStoreSubtitle(),
                style: AppTextStyles.description, textAlign: TextAlign.left)
          ],
        ),
        centerTitle: false);
  }
}
