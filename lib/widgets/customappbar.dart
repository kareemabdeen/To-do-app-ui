import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: tdBGColor,
    elevation: 0,
    leading: const Icon(
      Icons.menu,
      color: tdBlack,
      size: 30,
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 13),
        child: CircleAvatar(
          radius: 19,
          backgroundImage: AssetImage(
            'assets/images/WhatsApp Image 2022-12-10 at 1.22.58 AM - Copy.jpeg',
          ),
        ),
      )
    ],
  );
}
