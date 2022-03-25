import 'package:flutter/material.dart';

import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/screens/about-us.dart';


class TermsConditionsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar('Terms & Conditions', AboutUsScreen()),
      body: SafeArea(
        child: SingleChildScrollView (
          child: Column(
            children: [
              Image.asset('images/termsBannerTop.png'),
              SizedBox(
                height: spacer2,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
                child: Text(termAndConditionData),
              )
            ],
          ),
        ),
      ),
    );
 
 }
}
