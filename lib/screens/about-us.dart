import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/ouricons.dart';
import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/theimages.dart';

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
            SizedBox(
              height: spacer3,
            ),
            SvgPicture.asset(
              aboutUsIllScreen,
              height: centreIllheight,
            ),
            SizedBox(
              height: spacer2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: leftRightLayoutPadding,
                  vertical: topBottomLayoutPadding),
              child: Text(aboutUs),
            ),
            SizedBox(
              height: spacer1,
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
        trailing: ourSecondaryIcon(go),
      )),
    );
  }
}
