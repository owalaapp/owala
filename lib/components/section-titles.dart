import 'package:flutter/material.dart';
import 'package:owalaapp/constants/constants.dart';

Container ourSectionTitles(ourText) {
    return Container(
      width: 330.0,
      child: Text(
        ourText,
        style: TextStyle(fontSize: h5FontSize,
        fontWeight: FontWeight.bold),
      ),
    );
  }