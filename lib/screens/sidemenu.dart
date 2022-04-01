import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/ouricons.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/models/user.dart';
import 'package:owalaapp/screens/about-us.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'customer-support.dart';
import 'package:owalaapp/components/alertdialog.dart';
import 'package:owalaapp/components/dividers.dart';

class SideMenu extends StatefulWidget {
  // const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar(
          "My Account", HomeScreen(userLocationValue: userDeliveryArea)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightLayoutPadding, vertical: 20.0),
          child: Column(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    minRadius: 35.0,
                    backgroundImage: AssetImage(defaulUserProfileImage),
                  ),
                ),
                SizedBox(
                  width: spacer2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Hello, $userName',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, fontSize: h5FontSize),
                    // ),
                    Text(
                      userPhoneNumber.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: h5FontSize,
                      ),
                    )
                  ],
                ),
              ],
            ),
            ourDividerA(),

            // ListTile(
            //   textColor: Colors.black,
            //   leading: Icon(Icons.star),
            //   title: Text("Rate us on playstore"),
            //   onTap: () {
            //     // Navigator.push(context, MaterialPageRoute(builder: toScreen));
            //   },
            // ),

            sideMenuNavs(
                context, supportNavIcon, 'support', CustomerSupportScreen()),
            sideMenuNavs(context, aboutNavIcon, 'about', AboutUsScreen()),
            // sideMenuNavs(context, recentOrdersNavIcon, 'recent order',
            //     RecentOrdersScreen()),

            SizedBox(
              height: 250.0,
            ),
            OutlinedButton(
                // onPressed: () async {
                //   await _auth.signOut();
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => MyApp()));
                // },
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => OurAlertDialog(context,
                          "Log out", "Are you sure you want to logout?"),
                    ),
                child: Text(
                  "Log out",
                  style: TextStyle(color: Colors.red),
                )),

            SizedBox(
              height: spacer2,
            ),
            Text(
              "App version 1.0.0+1",
              style: TextStyle(color: secondaryText),
            )
          ]),
        ),
      ),
    );
  }

  ListTile sideMenuNavs(BuildContext context, ourIcon, ourTitle, screen) {
    return ListTile(
      textColor: Colors.black,
      leading: ourSecondaryIcon(ourIcon),
      title: Text(ourTitle),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}