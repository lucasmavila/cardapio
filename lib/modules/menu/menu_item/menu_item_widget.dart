import 'package:cardap/shared/models/item_model.dart';
import 'package:cardap/shared/themes/app_text_styles.dart';
import 'package:cardap/shared/themes/responsive_padding.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatefulWidget {
  final ItemModel data;
  const MenuItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _MenuItemWidgetState createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsivePadding();

    return Padding(
      padding: responsive.getPadding(context),
      child: Card(
        child: ListTile(
            horizontalTitleGap: 15,
            enableFeedback: true,
            enabled: true,
            onTap: () {
              Navigator.pushNamed(context, "/menuItemDetails",
                  arguments: widget.data);
            },
            leading: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(
                          widget.data.images[widget.data.mainPhoto]))),
            ),
            title: Text.rich(TextSpan(
              text: widget.data.name,
              style: AppTextStyles.smallTitle,
            )),
            subtitle: Text(
              widget.data.description,
              style: AppTextStyles.description,
            ),
            trailing:
                Text(widget.data.price.toString(), style: AppTextStyles.price)),
      ),
    );
  }
}
