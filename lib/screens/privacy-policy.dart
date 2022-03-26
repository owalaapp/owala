import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/screens/about-us.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Privacy Policy", AboutUsScreen()),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(privacyPolicyTopBannerScr),
              SizedBox(
                height: spacer2,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
                child: Text(privacyAndPolicyText),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
