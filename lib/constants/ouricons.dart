import 'package:flutter/material.dart';
import 'package:owalaapp/constants/constants.dart';

// ICON Color
const defaultIconColor = Colors.grey;


Icon ourPrimaryIcon(iconName, iconColor) {
  return Icon(
    iconName,
    size: spacer3,
    color: iconColor,
  );
}

Icon ourSecondaryIcon(iconName) {
  return Icon(
    iconName,
    color: defaultIconColor,
  );
}

// GLOBAL
const locationIcon = Icons.location_on_outlined;
const go = Icons.chevron_right;
const goBAck = Icons.arrow_back;

// HOME
const sideMenuIcon = Icons.menu;

// SIDEMENU SCREEN
const supportNavIcon = Icons.live_help;
const aboutNavIcon = Icons.info;
const recentOrdersNavIcon = Icons.shopping_basket;

// CUSTOMER SUPPORT SCREEN
const callIcon = Icons.call;
const emailIcon = Icons.email;
const chatIcon = Icons.chat;

// ORDER CONFIRMED SCREEN
const wereHereIcon = Icons.safety_divider;
