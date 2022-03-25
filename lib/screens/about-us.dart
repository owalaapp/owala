import 'package:flutter/material.dart';

import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';

// Screens
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:owalaapp/screens/terms-conditions.dart';
import 'package:owalaapp/screens/privacy-policy.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("About", SideMenu()),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: leftRightPadding,
                  vertical: topBottomLayoutPadding),
              child: Text(aboutUs),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  aboutBottomCards(
                      context, 'Terms & Conditions', TermsConditionsScreen()),
                  aboutBottomCards(
                      context, 'Privacy Policy', PrivacyPolicyScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  GestureDetector aboutBottomCards(BuildContext context, ourTitle, ourScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ourScreen));
      },
      child: Card(
          child: ListTile(
        title: Text(
          ourTitle,
        ),
        trailing: Icon(Icons.chevron_right,
        ),
      )),
    );
  }
}
