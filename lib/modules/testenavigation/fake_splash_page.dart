import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/shared/models/restaurant/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FakeSplashPage extends StatefulWidget {
  const FakeSplashPage({Key? key, required this.restaurantController})
      : super(key: key);
  final RestaurantController restaurantController;

  @override
  _FakeSplashPageState createState() => _FakeSplashPageState();
}

class _FakeSplashPageState extends State<FakeSplashPage> {
  Future<RestaurantController>? _future;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  void didUpdateWidget(covariant FakeSplashPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // refresh cached data
    if (oldWidget.restaurantController != widget.restaurantController) fetch();
  }

  void fetch() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<RestaurantController>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            assert(snapshot.hasData);
            return Text(widget.restaurantController.restaurantId);
          },
        ),
      ),
    );
  }
}
