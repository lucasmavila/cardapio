import 'package:cardap/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const CardapApp());
}

class CardapApp extends StatelessWidget {
  const CardapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
