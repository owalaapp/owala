import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/constants/ouricons.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/screens/recent-orders.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/dividers.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/user.dart';

import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/screens/customer-support.dart';

// Screens
import 'package:owalaapp/screens/home.dart';

enum OrdersState { SHOW_RECENT_ORDER, SHOW_NO_ORDERS_YET }
enum latOrderStatus { ORDER_SUCCEFFUL, ORDER_CANCELLED, ON_THE_WAY }

class OrderConfirmedScreen extends StatefulWidget {
  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmedScreen> createState() => _OrderConfirmedScreenState();
}

class _OrderConfirmedScreenState extends State<OrderConfirmedScreen> {
  String orderDetailsForUs = '$userName has ordered $productChoosed';
  @override
  void initState() {
    //  launch(whatsappLinkOrderDetailsForUs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentLastOrderStatus = latOrderStatus.ON_THE_WAY;

    // var random = Random();
    // int min = 000000;
    // int max = 999999;
    // userRecentOrderId = min + random.nextInt(max - min);

    String showLastOrderStatus = '';

    if (currentLastOrderStatus == latOrderStatus.ON_THE_WAY) {
      setState(() {
        showLastOrderStatus = 'ON THE WAY';
      });
    }

    return Scaffold(
      // appBar: ourAppBar("Order Details", HomeScreen()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
          child: Column(children: [
            Center(child: SvgPicture.asset(confimedStickerScr)),
            SizedBox(
              height: spacer2,
            ),
            Text(
              'Order Confirmed!',
              style:
                  TextStyle(fontSize: h4FontSize, fontWeight: FontWeight.bold),
            ),
            Text(
              'Order Status : $showLastOrderStatus',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),

            Container(
              child: ourDividerA(),
            ),
            ourSectionTitles('Your order details'),
            SizedBox(
              height: spacer2,
            ),
            // Text("Order Id: #$userRecentOrderId"),
            ListTile(
              leading: Image.asset('images/$productChoosed-cart.png'),
              title: Text('$productChoosed Cart'.toUpperCase()),
              subtitle: Text(
                  'Our owala captain wil contact you shortly via call or whatsapp.'),
              trailing: Text(
                'Rs.$vegetableCartServiceCharge',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: ourDividerA(),
            ),
            // ourConfirmedListTiles('userIcon', '$userName, $userPhoneNumber', ''),
            ourConfirmedListTiles(
                locationIllIcon, 'Delivery Address', userFinalComplteAddress),

            Container(
              child: ourDividerA(),
            ),

            ourSectionTitles('👋 Need help with order?'),

            Card(
              child: supportCards(wereHereIcon, 'Chat with us',
                  "we're here for you ", chatWithUs),
            ),

            SizedBox(
              height: spacer3 + spacer3,
            )
          ]),
        ),
      )),
    );
  }

  ListTile ourConfirmedListTiles(ourImage, ourText, ourSubTitle) {
    return ListTile(
      leading: SvgPicture.asset(
        ourImage,
        width: 20.0,
      ),
      title: Text(ourText),
      subtitle: Text(ourSubTitle),
    );
  }

  void chatWithUs() async {
    launch(whatsappLink);
  }
}
