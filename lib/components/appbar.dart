import 'package:flutter/material.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/screens/home.dart';

AppBar ourAppBar(String title) {
  return AppBar(
    title: Text(title,
    style: TextStyle(
      color: Colors.white
    ),),
    backgroundColor: primaryColor,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  );
}
