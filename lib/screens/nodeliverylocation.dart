import 'package:flutter/material.dart';

import 'package:owalaapp/components/logoappbar.dart';
import 'package:owalaapp/constants/theimages.dart';

// SCREENS
import 'package:owalaapp/components/titleImageScreen.dart';

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
        body: imageTitleScreenWidget(noDeliveryIll, "We're comming soon! 🤗",
            "Sorry, We didn't deliver here yet but we're\nworking very hard to let you do real shopping instead of boring window shopping."),
      ),
    );
  }
}
