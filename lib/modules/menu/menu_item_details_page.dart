import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/modules/restaurant/restaurant_controller.dart';
import 'package:cardap/shared/models/store_models/item_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:cardap/shared/widgets/confirm_button/confirm_button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuItemDetailsPage extends StatefulWidget {
  const MenuItemDetailsPage(
      {Key? key,
      required this.restaurantId,
      required this.itemId,
      required this.categoryId})
      : super(key: key);
  final String restaurantId;
  final String itemId;
  final String categoryId;

  @override
  _MenuItemDetailsPageState createState() => _MenuItemDetailsPageState();
}

class _MenuItemDetailsPageState extends State<MenuItemDetailsPage> {
  Future<String>? _restaurantReady;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsivePadding();
    final cartController = Provider.of<CartController>(context);
    final restaurantNotifier = Provider.of<RestaurantController>(context);
    _restaurantReady = restaurantNotifier.loadFromApiUrl(widget.restaurantId);

    return FutureBuilder<String>(
      future: _restaurantReady,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          cartController.selectItem(restaurantNotifier
              .getRestaurantMenuItemById(widget.categoryId, widget.itemId));
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: AppBar(
              toolbarHeight: 80,
              centerTitle: true,
              title: Text(cartController.getItemSelectedName(),
                  style: AppTextStyles.mediumTitle),
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_rounded, size: 30),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: AppColors.background,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: responsive.getPadding(context),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: false,
                        ),
                        items:
                            cartController.getItemSelectedImages().map((image) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 300,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    //border: Border.all(width: 1),
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(image),
                                        fit: BoxFit.cover)),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Text(
                        cartController.getItemSelectedDescription(),
                        style: AppTextStyles.body,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text("Extras", style: AppTextStyles.smallTitle),
                    ),
                    cartController.getItemSelectedExtrasListLength() == 0
                        ? const Text("-")
                        : Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppColors.background,
                                border: Border.all(
                                    width: 1, color: AppColors.stroke),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: cartController
                                    .getItemSelectedExtrasListLength(),
                                itemBuilder:
                                    (BuildContext context, indexItemBuilder) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Text(
                                            cartController
                                                .getExtraItemSelectedName(
                                                    indexItemBuilder),
                                            style: AppTextStyles.body,
                                          ),
                                        ),
                                        Row(children: [
                                          RichText(
                                              text:
                                                  TextSpan(children: <TextSpan>[
                                            TextSpan(
                                                text: "R\$ ",
                                                style:
                                                    AppTextStyles.littlePrice),
                                            TextSpan(
                                                text: cartController
                                                    .getExtraItemSelectedPrice(
                                                        indexItemBuilder)
                                                    .toString(),
                                                style:
                                                    AppTextStyles.littlePrice),
                                          ])),
                                          IconButton(
                                              onPressed: () {
                                                cartController
                                                    .addExtraItemSelected(
                                                        indexItemBuilder);
                                              },
                                              color: AppColors.primary,
                                              icon: const Icon(
                                                  Icons.control_point)),
                                          Text(
                                              cartController
                                                  .getExtraItemSelectedCount(
                                                      indexItemBuilder)
                                                  .toString(),
                                              style: AppTextStyles.body),
                                          IconButton(
                                              color: AppColors.primary,
                                              onPressed: () {
                                                cartController
                                                    .removeExtraItemSelected(
                                                        indexItemBuilder);
                                              },
                                              icon: const Icon(
                                                  Icons.remove_circle_outline))
                                        ])
                                      ],
                                    ),
                                  );
                                })),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child:
                          Text("Observação", style: AppTextStyles.smallTitle),
                    ),
                    TextField(
                      maxLines: 2,
                      maxLength: 100,
                      onChanged: (value) {
                        cartController.changeItemSelectedObservation(value);
                      },
                      decoration: InputDecoration(
                        hintText: "Exemplo: retirar a cebola",
                        hintStyle: AppTextStyles.description,
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: AppColors.stroke),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, right: 50, left: 50),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: AppTextStyles.mediumTitle),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(text: "R\$ ", style: AppTextStyles.price),
                            TextSpan(
                                text: cartController
                                    .getItemSelectedTotalAmount()
                                    .toString(),
                                style: AppTextStyles.price),
                          ])),
                        ],
                      ),
                    ),
                    ConfirmButtonWidget(
                        label: "Adicionar ao carrinho",
                        onPressed: () {
                          cartController.addItemToCart();
                          Navigator.pop(context);
                        },
                        readyToPress: true)
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
