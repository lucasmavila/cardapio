import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/routes/routes.dart';
import 'package:cardap/routes/routes_controller.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  final String restaurantId;
  const SplashPage({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<String>? _restaurantReady;

  @override
  Widget build(BuildContext context) {
    final restaurantNotifier = Provider.of<RestaurantController>(context);
    if (!restaurantNotifier.restaurantReady) {
      _restaurantReady = restaurantNotifier.loadFromApiUrl(widget.restaurantId);
    }
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        //context.go('/exemplo01/menu');
      });
    });
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: _restaurantReady,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            assert(snapshot.hasData);
            return GestureDetector(
                onTap: () => context.go('/exemplo01/menu'),
                child: Text(restaurantNotifier.getStoreName()));
          },
        ),
      ),
    );
  }
}
