import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/elevatedPrimaryButton.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:owalaapp/screens/order-confirmed.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Add address details", OrderConfirmedScreen()),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: leftRightPadding, vertical: 20.0),
            child: Column(
              children: [
                ourAddressDetailInputs(
                    '(House no. / flat no) , floor no.', Icons.home),
                ourAddressDetailInputs('Landmark', Icons.location_on),
                   SizedBox(
                  width: primaryBtnWidth,
                  height: primaryBtnHeight,
                  child: ourElevatedPrimaryBtn(context, OrderConfirmedScreen(), "Add address"),
                ),
              ],

            ),
          ),
        ],
      )),
    );
  }

  TextFormField ourAddressDetailInputs(ourLabelText, ourIcon) {
    return TextFormField(
      decoration:
          InputDecoration(label: Text(ourLabelText), icon: Icon(ourIcon)),
    );
  }
}
