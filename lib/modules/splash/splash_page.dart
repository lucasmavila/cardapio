import 'package:cardap/shared/auth/store_controller.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storeController = context.read<StoreController>();
    storeController.loadFromId(context);

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SvgPicture.asset(AppImages.logoFull),
        ));
  }
}
