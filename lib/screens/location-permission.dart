import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:owalaapp/constants/ouricons.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/screens/home.dart';

import 'package:owalaapp/screens/login.dart';
import 'package:owalaapp/screens/nodeliverylocation.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/user.dart';

class LocartionPermSc extends StatefulWidget {
  const LocartionPermSc({Key? key}) : super(key: key);

  @override
  _LocartionPermSc createState() => _LocartionPermSc();
}

class _LocartionPermSc extends State<LocartionPermSc> {
  @override
  void initState() {
    super.initState();
    asLocationFinder();
  }

  void asLocationFinder() async {
    Position position = await _getGeoLocationPosition();
    userLatitude = position.latitude;
    userLongitude = position.longitude;

    GetAddressFromLatLong(position);
  }

  bool showLoading = false;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permi ssions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    userPincode = place.postalCode.toString();
    userCountry = place.country.toString();
    userCity = place.locality.toString();
    userStreet = place.street.toString();
    userSubLocality = place.subLocality.toString();

    if (userPincode == '122001') {
    
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HomeScreen(userLocationValue: userDeliveryArea)));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LocationNotServicable()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(locationPermissionIll, width: centreIllheight),
                SizedBox(
                  height: spacer2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ourPrimaryIcon(locationIcon, defaultIconColor),
                    Text(
                      "Location",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: h6FontSize, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: spacer1,
                ),
                Text(
                  'Please enable location permission to have an\neasy experience with our delivery.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: spacer3,
                ),
                Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
