import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/components/logoappbar.dart';
import 'package:owalaapp/components/titleImageScreen.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

class LocationNotServicable extends StatelessWidget {
  const LocationNotServicable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: logoAppBar(),
        body: imageTitleScreenWidget(
            'images/notdelivery.svg',
            "We're comming soon! 🤗",
            "Sorry, We didn't deliver here yet but we're\nworking very hard to let you buy things in our style as soon as possible."),
      ),
    );
  }
}
