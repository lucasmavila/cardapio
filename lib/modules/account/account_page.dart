import 'package:cardap/shared/widgets/header/header_widget.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      HeaderWidget(title: "Minha conta"),
    ]);
  }
}
