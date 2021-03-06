import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/cart/cart_list_widget.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:cardap/shared/widgets/confirm_button/confirm_button_widget.dart';
import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartController = context.watch<CartController>();

    return Stack(
      children: [
        Column(
          children: const [HeaderWidget(title: "Carrinho"), CartListWidget()],
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: Padding(
              padding: ResponsivePadding().getPadding(context),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Entrega: Faça login para continuar",
                          style: AppTextStyles.body,
                        ),
                        Text(
                          "Taxa: R\$ ${cartController.getCartDeliveryTax()}",
                          style: AppTextStyles.smallTitle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text.rich(TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Total: ",
                                  style: AppTextStyles.mediumTitle),
                              TextSpan(
                                  text:
                                      "R\$ ${cartController.getCartTotalAmount()}",
                                  style: AppTextStyles.price)
                            ]))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: ConfirmButtonWidget(
                            label: "Faça login",
                            readyToPress: false,
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ]),
            ))
      ],
    );
  }
}
