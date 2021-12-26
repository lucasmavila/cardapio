import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FakeMenuItemPage extends StatefulWidget {
  const FakeMenuItemPage({Key? key}) : super(key: key);

  @override
  _FakeMenuItemPageState createState() => _FakeMenuItemPageState();
}

class _FakeMenuItemPageState extends State<FakeMenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Page'),
            TextButton(
                onPressed: () => GoRouter.of(context).go('/exemplo01/home'),
                child: Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
