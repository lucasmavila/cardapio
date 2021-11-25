import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final String title;
  const HeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsivePadding();
    return Padding(
      padding: responsive.getPadding(context),
      child: Container(
        child: Text(widget.title,
            textAlign: TextAlign.center, style: AppTextStyles.mediumTitle),
        height: 50,
        margin: EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: AppColors.stroke, width: 2),
        )),
        alignment: Alignment.center,
      ),
    );
  }
}
