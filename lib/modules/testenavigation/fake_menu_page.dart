import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FakeMenuPage extends StatefulWidget {
  const FakeMenuPage({Key? key}) : super(key: key);

  @override
  _FakeMenuPageState createState() => _FakeMenuPageState();
}

class _FakeMenuPageState extends State<FakeMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Account Page'),
            TextButton(
                onPressed: () => GoRouter.of(context).go('/exemplo01/home'),
                child: Text('Go to Home'))
          ],
        ),
      ),
    );
  }
}
