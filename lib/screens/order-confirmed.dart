import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/dividers.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/components/cards.dart';

class OrderConfirmedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Order Details", HomeScreen()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightPadding, vertical: 20.0),
          child: Column(children: [
            Center(child: Image.asset('images/confirmedSticker.gif')),
            Text(
              'Order Confirmed!',
              style:
                  TextStyle(fontSize: h4FontSize, fontWeight: FontWeight.bold),
            ),
            Container(
              child: ourDividerA(),
            ),
            ourSectionTitles('Your order details'),
            textCardGapper(),

            ListTile(
              leading: Image.asset('images/$productChoosed-cart.png'),
              title: Text('$productChoosed Cart'),
              subtitle: Text(
                  'your cart will arrive with in $deliveryTime mins at your doorstep.'),
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
                'locationPinIll', 'Delivery Address', '$userDeliveryArea'),

            Container(
              child: ourDividerA(),
            ),

            ourSectionTitles('👋 Need help with order?'),

            textCardGapper(),
            Card(
              child: supportCards(Icons.safety_divider, 'Chat with us',
                  'were here for you ', chatWithUs),
            ),

            SizedBox(
              height: 100.0,
            )
          ]),
        ),
      )),
    );
  }

  SizedBox textCardGapper() {
    return SizedBox(
      height: 10.0,
    );
  }

  ListTile ourConfirmedListTiles(ourImage, ourText, ourSubTitle) {
    return ListTile(
      leading: SvgPicture.asset(
        'images/$ourImage.svg',
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
