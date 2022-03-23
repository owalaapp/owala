import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/logoappbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:double_back_to_close/double_back_to_close.dart';

class LocationNotServicable extends StatelessWidget {
  const LocationNotServicable({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return DoubleBack(
              message: backToast,

      child: Scaffold(
                  appBar: logoAppBar(),
        body: SafeArea(child: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SvgPicture.asset('images/notdelivery.svg',
              height: 150.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("We're comming very soon!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: h5FontSize
              ),
              textAlign: TextAlign.center),
              Text("Sorry, We didn't deliver here yet at your location.")
            ],),
          ),
        )),
        
        
      ),
    );
  }

}