import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/screens/about-us.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:owalaapp/screens/recent-orders.dart';
import 'customer-support.dart';
import 'package:owalaapp/components/alertdialog.dart';
import 'package:owalaapp/components/dividers.dart';
import 'package:owalaapp/constants/user.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({ Key? key }) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("My Account", HomeScreen()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightPadding, vertical: 20.0),
          child: Column(children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  minRadius: 35.0,
                  backgroundImage: AssetImage('images/profileAvatar.png'),
                  
                ),
                SizedBox(
                  width: spacer2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $userName',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: h5FontSize),
                    ),
                    Text(userPhoneNumber.toString())
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

            ListTile(
              textColor: Colors.black,
              leading: Icon(Icons.live_help),
              title: Text("support"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerSupportScreen()),
                );
              },
            ),

            ListTile(
              textColor: Colors.black,
              leading: Icon(Icons.info),
              title: Text("about"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),

                 ListTile(
              textColor: Colors.black,
              leading: Icon(Icons.shopping_basket),
              title: Text("recent Orders"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecentOrdersScreen()),
                );
              },
            ),

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
}


