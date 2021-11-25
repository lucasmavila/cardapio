import 'package:cardap/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CardapApp());
}

class CardapApp extends StatelessWidget {
  const CardapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}
