import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/components/cards.dart';


class CustomerSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Customer Support", SideMenu()),
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Image.asset("images/customer-support-top-banner.png"),
          ),
          SizedBox(
            height: 80.0,
          ),
          Text(
            "Contact us",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: h6FontSize),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
              child: supportCards(
                  Icons.call, 'Phone', 'Call our customer support', callUs)),
          Our10pxSizedBox(),
          Card(child: supportCards(Icons.email, 'Email', ourEmailId, emailUs)),
          Our10pxSizedBox(),
          Card(
              child: supportCards(Icons.chat, 'Chat',
                  'Chat with our support team', chatWithUs)),
        ],
      )),
    );
  }

  SizedBox Our10pxSizedBox() {
    return SizedBox(
      height: 10.0,
    );
  }

  Divider ourCardDivider() {
    return Divider(
      color: Colors.grey[200],
      thickness: 10.0,
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
