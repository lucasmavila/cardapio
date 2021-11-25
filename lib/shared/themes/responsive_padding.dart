import 'package:flutter/material.dart';

class ResponsivePadding {
  getPadding(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double horizontalPadding;

    bool isTablet = screenWidth < 1100 && screenWidth >= 650;
    bool isDesktop = screenWidth > 1100;

    if (isDesktop) {
      horizontalPadding = screenWidth * 0.3;
    } else if (isTablet) {
      horizontalPadding = screenWidth * 0.1;
    } else {
      horizontalPadding = 20;
    }

    return EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 5);
  }
}
