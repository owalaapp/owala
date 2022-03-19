import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/strings.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/screens/terms-conditions.dart';
import 'privacy-policy.dart';

class AboutUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("About"),
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
                  GestureDetector(
                    onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => TermsConditions()));
                    },
                    child: Card(
                        
                        child: ListTile(
                      title: Text(
                        'Terms & Conditions',
                      ),
                    )),
                  ),

                  GestureDetector(
                       onTap: (){
Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                    },
                    child: Card(
                      
                        child: ListTile(
                      title: Text(
                        'Privacy Policy',
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
