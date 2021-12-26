import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/routes/routes.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/modules/page/botton_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppBottonNavigation extends StatefulWidget {
  const AppBottonNavigation(
      {Key? key, required this.pageIndex, required this.restaurantId})
      : super(key: key);
  final int pageIndex;
  final String restaurantId;

  @override
  _AppBottonNavigationState createState() => _AppBottonNavigationState();
}

class _AppBottonNavigationState extends State<AppBottonNavigation> {
  void changePage(int pageButtonIndex, BuildContext context) {
    List<String> pages = ['menu', 'cart', 'orders', 'account'];
    GoRouter.of(context)
        .go('/${widget.restaurantId}/${pages[pageButtonIndex]}');
  }

  @override
  Widget build(BuildContext context) {
    final cartController = Provider.of<CartController>(context);
    const logged = false;
    return BottomNavigationBar(
      selectedItemColor: AppColors.primary,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: AppTextStyles.body,
      unselectedItemColor: AppColors.stroke,
      unselectedLabelStyle: AppTextStyles.body,
      showUnselectedLabels: true,
      elevation: 20,
      iconSize: 30,
      currentIndex: widget.pageIndex,
      onTap: (index) => changePage(index, context),
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: "Cardápio",
        ),
        BottomNavigationBarItem(
          icon: cartController.getSavedItemsLength() == 0
              ? const Icon(Icons.shopping_cart_rounded)
              : Stack(
                  children: <Widget>[
                    const Icon(Icons.shopping_cart_rounded),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints:
                            const BoxConstraints(minHeight: 12, minWidth: 12),
                        child: Text(
                          cartController.getSavedItemsLength().toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
          label: "Carrinho",
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_rounded), label: "Pedidos"),
        BottomNavigationBarItem(
          icon: logged
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    "https://github.com/lucasmavila.png",
                    height: 30,
                  ),
                )
              : const Icon(Icons.person_rounded),
          label: "Conta",
        ),
      ],
    );
  }
}
