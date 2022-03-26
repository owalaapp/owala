import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/theimages.dart';

SafeArea imageTitleScreenWidget(ourImage, ourTitle, ourDescription) {
  return SafeArea(
      child: Center(
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: leftRightLayoutPadding, vertical: topBottomLayoutPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ourImage,
            height: centreIllheight,
          ),
          SizedBox(
            height: spacer3,
          ),
          Text(ourTitle,
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: h5FontSize),
              textAlign: TextAlign.center),
          SizedBox(
            height: spacer1,
          ),
          Text(
            ourDescription,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  ));
}
