import 'package:cardap/modules/cart/cart_controller.dart';
import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/models/order_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:cardap/shared/widgets/confirm_button/confirm_button_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuItemDetailsPage extends StatefulWidget {
  final ItemModel itemSelected;
  const MenuItemDetailsPage({Key? key, required this.itemSelected})
      : super(key: key);

  @override
  _MenuItemDetailsPageState createState() => _MenuItemDetailsPageState();
}

class _MenuItemDetailsPageState extends State<MenuItemDetailsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.itemSelected.additionalItems != null) {
      for (var element in widget.itemSelected.additionalItems!) {
        element.count = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final ordersController = CartController();
    final responsive = ResponsivePadding();
    final carouselImages = widget.itemSelected.images;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: Text(widget.itemSelected.name, style: AppTextStyles.mediumTitle),
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
                    autoPlay: true,
                  ),
                  items: carouselImages.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: 300,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              //border: Border.all(width: 1),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover)),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text(
                  widget.itemSelected.description,
                  style: AppTextStyles.body,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text("Extras", style: AppTextStyles.smallTitle),
              ),
              widget.itemSelected.additionalItems == null
                  ? const Text("-")
                  : Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.background,
                          border: Border.all(width: 1, color: AppColors.stroke),
                          borderRadius: BorderRadius.circular(10)),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount:
                              widget.itemSelected.additionalItems!.length,
                          itemBuilder:
                              (BuildContext context, indexItemBuilder) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      widget
                                          .itemSelected
                                          .additionalItems![indexItemBuilder]
                                          .name,
                                      style: AppTextStyles.body,
                                    ),
                                  ),
                                  Row(children: [
                                    RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: "R\$ ",
                                          style: AppTextStyles.littlePrice),
                                      TextSpan(
                                          text: widget
                                              .itemSelected
                                              .additionalItems![
                                                  indexItemBuilder]
                                              .price
                                              .toString(),
                                          style: AppTextStyles.littlePrice),
                                    ])),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            widget
                                                .itemSelected
                                                .additionalItems![
                                                    indexItemBuilder]
                                                .count = widget
                                                    .itemSelected
                                                    .additionalItems![
                                                        indexItemBuilder]
                                                    .count! +
                                                1;
                                          });
                                        },
                                        color: AppColors.primary,
                                        icon: const Icon(Icons.control_point)),
                                    Text(
                                        widget
                                            .itemSelected
                                            .additionalItems![indexItemBuilder]
                                            .count
                                            .toString(),
                                        style: AppTextStyles.body),
                                    IconButton(
                                        color: AppColors.primary,
                                        onPressed: () {
                                          setState(() {
                                            if (widget
                                                    .itemSelected
                                                    .additionalItems![
                                                        indexItemBuilder]
                                                    .count !=
                                                0) {
                                              widget
                                                  .itemSelected
                                                  .additionalItems![
                                                      indexItemBuilder]
                                                  .count = widget
                                                      .itemSelected
                                                      .additionalItems![
                                                          indexItemBuilder]
                                                      .count! -
                                                  1;
                                            }
                                          });
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
                child: Text("Observação", style: AppTextStyles.smallTitle),
              ),
              TextField(
                maxLines: 2,
                maxLength: 100,
                onChanged: (value) {
                  widget.itemSelected.copyWith(description: value);
                },
                decoration: InputDecoration(
                  hintText: "Exemplo: retirar a cebola",
                  hintStyle: AppTextStyles.description,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: AppColors.stroke),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 50, left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: AppTextStyles.mediumTitle),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(text: "R\$ ", style: AppTextStyles.price),
                      TextSpan(
                          text: (widget.itemSelected.price +
                                  (widget.itemSelected.additionalItems != null
                                      ? widget.itemSelected.additionalItems!
                                          .fold(
                                              0,
                                              (previousValue, element) =>
                                                  previousValue +
                                                  element.price *
                                                      element.count!)
                                      : 0))
                              .toString(),
                          style: AppTextStyles.price),
                    ])),
                  ],
                ),
              ),
              ConfirmButtonWidget(
                  label: "Adicionar ao carrinho",
                  onPressed: () async {
                    ordersController.includeOrderItem(widget.itemSelected);
                    Navigator.pop(context);
                  },
                  readyToPress: true)
            ],
          ),
        ),
      ),
    );
  }
}
