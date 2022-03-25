import 'package:flutter/material.dart';
import 'package:owalaapp/constants/constants.dart';


AppBar ourAppBar(String title, toScreen) {
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
Navigator.of(context).push(MaterialPageRoute(builder: (context) => toScreen));

          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    ),
  );
}
