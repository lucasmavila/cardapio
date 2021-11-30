import 'package:cardap/shared/models/store_model.dart';
import 'package:cardap/shared/themes/app_colors.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppBarHeader extends StatefulWidget {
  final StoreModel store;
  const AppBarHeader({Key? key, required this.store}) : super(key: key);

  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.background,
        actionsIconTheme: const IconThemeData.fallback(),
        elevation: 0,
        titleSpacing: 10,
        leadingWidth: 80,
        toolbarHeight: 80,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image: widget.store.logo != null
                      ? NetworkImage(widget.store.logo!)
                      : const NetworkImage(
                          "https://www.google.com.br/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"))),
        ),
        title: Column(
          children: [
            Text(widget.store.name ?? "",
                style: AppTextStyles.mediumTitle, textAlign: TextAlign.left),
            Text(
                "${widget.store.address!.city}, ${widget.store.address!.state}",
                style: AppTextStyles.description,
                textAlign: TextAlign.left)
          ],
        ),
        centerTitle: false);
  }
}
