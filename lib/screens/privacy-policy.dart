import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';
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
              Image.network('https://firebasestorage.googleapis.com/v0/b/owala-8dc48.appspot.com/o/privacyPolicyTopBanner.png?alt=media&token=a526a81f-e4ea-40ac-80b4-70cdf7b01ec0'),
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
