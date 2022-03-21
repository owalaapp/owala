import 'package:flutter/material.dart';


  ListTile supportCards(ourIcon, ourMainText, ourSubtText, method) {
    return ListTile(
      leading: Icon(ourIcon),
      title: Text(ourMainText),
      subtitle: Text(ourSubtText),
      onTap: method,
    );
  }