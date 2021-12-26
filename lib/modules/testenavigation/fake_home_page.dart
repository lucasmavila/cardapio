import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FakeHomePage extends StatefulWidget {
  const FakeHomePage({Key? key}) : super(key: key);

  @override
  _FakeHomePageState createState() => _FakeHomePageState();
}

class _FakeHomePageState extends State<FakeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cart Page'),
            TextButton(
                onPressed: () => GoRouter.of(context).go('/exemplo01/menu'),
                child: Text('Go to Menu'))
          ],
        ),
      ),
    );
  }
}
