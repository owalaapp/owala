import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/customtheme.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owalaapp/components/appbar.dart';

import 'about-us.dart';


class TermsConditions extends StatelessWidget {

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
                height: 20.0,
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
