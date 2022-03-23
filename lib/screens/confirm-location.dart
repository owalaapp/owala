import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/components/elevatedPrimaryButton.dart';
import 'package:owalaapp/screens/home.dart';
import 'address.dart';
import 'package:owalaapp/components/dividers.dart';


class ConfirmCurrentLocationScreen extends StatefulWidget {
  const ConfirmCurrentLocationScreen({ Key? key }) : super(key: key);

  @override
  State<ConfirmCurrentLocationScreen> createState() => _ConfirmCurrentLocationScreenState();
}

class _ConfirmCurrentLocationScreenState extends State<ConfirmCurrentLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Confirm Location", HomeScreen()),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your delivery location'),
            Container(
              child: ourDividerA(),
            ),
            Row(
              children: [
                Text(
                  userDeliveryArea,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () => {print("CHANGE LOCATION")},
                  child: Chip(
                      label: Text(
                    "Change",
                  )),
                ),

              ],
            ),
            SizedBox(
              height: buttonAboveMargin,
            ),
            SizedBox(
              width: primaryBtnWidth,
              height: primaryBtnHeight,
              child: ourElevatedPrimaryBtn(
                  context, AddAddressScreen(), "Confirm & Contunue"),
            ),
          ],
        ),
      )),
    );
  }
}