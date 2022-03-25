import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/components/cards.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Customer Support", SideMenu()),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
        child: Column(
          children: [
            SizedBox(
              height: spacer3,
            ),
            Center(
              child: SvgPicture.asset(
                'images/cs-screen-ill.svg',
                height: centreIllheight,
              ),
            ),
            SizedBox(
              height: spacer3 + spacer2,
            ),
            ourSectionTitles("Contact us"),
            SizedBox(
              height: spacer2,
            ),
            Card(
                child: supportCards(
                    Icons.call, 'Phone', 'Call our customer support', callUs)),
            SizedBox(
              height: spacer2,
            ),
            Card(
                child: supportCards(Icons.email, 'Email', ourEmailId, emailUs)),
            SizedBox(
              height: spacer2,
            ),
            Card(
                child: supportCards(Icons.chat, 'Chat',
                    'Chat with our support team', chatWithUs)),
          ],
        ),
      )),
    );
  }

  void callUs() async {
    launch('tel://+$ourContactNumber');
  }

  void emailUs() async {
    launch('mailto:$ourEmailId');
  }

  void chatWithUs() async {
    launch(whatsappLink);
  }
}
