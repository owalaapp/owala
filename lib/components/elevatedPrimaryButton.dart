import 'package:flutter/material.dart';

ElevatedButton ourElevatedPrimaryBtn(BuildContext context, toScreen, ourText) {
  return ElevatedButton(
      style: ButtonStyle(),
      onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => toScreen))
          },
      child: Text(
        ourText,
        style: TextStyle(color: Colors.white),
      ));
}
