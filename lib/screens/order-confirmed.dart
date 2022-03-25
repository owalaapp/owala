import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/dividers.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/user.dart';

import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/components/cards.dart';

// Screens
import 'package:owalaapp/screens/home.dart';


class OrderConfirmedScreen extends StatefulWidget {
  const OrderConfirmedScreen({ Key? key }) : super(key: key);

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
         var random =  Random();
    int min = 000000;
    int max = 999999;
    userRecentOrderId = min + random.nextInt(max - min);
  

    return Scaffold(
            appBar: ourAppBar("Order Details", HomeScreen()),

      body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
            child: Column(children: [
              Center(child: SvgPicture.asset('images/confirmedSticker.svg')),
              SizedBox(
                height: spacer2,
              ),
              Text(
                'Order Confirmed!',
                style:
                    TextStyle(fontSize: h4FontSize, fontWeight: FontWeight.bold),
              ),
              Container(
                child: ourDividerA(),
              ),
              ourSectionTitles('Your order details'),
              SizedBox(
                height: spacer2,
              ),
              Text("Order Id: #$userRecentOrderId"),
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
                  'locationPinIll', 'Delivery Address', userFinalComplteAddress),
    
              Container(
                child: ourDividerA(),
              ),
    
              ourSectionTitles('👋 Need help with order?'),
    
              Card(
                child: supportCards(Icons.safety_divider, 'Chat with us',
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


