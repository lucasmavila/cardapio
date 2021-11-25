import 'package:cardap/shared/auth/auth_controller.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.loadFromLink(context);

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SvgPicture.asset(AppImages.logoFull),
        ));
  }
}
