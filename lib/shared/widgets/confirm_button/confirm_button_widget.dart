import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final String label;
  final bool readyToPress;
  final VoidCallback onPressed;
  const ConfirmButtonWidget(
      {Key? key,
      required this.label,
      required this.onPressed,
      required this.readyToPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsivePadding();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: responsive.getPadding(context),
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: readyToPress ? AppColors.primary : AppColors.stroke,
            borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: AppTextStyles.buttonWhite,
            )),
      ),
    );
  }
}
