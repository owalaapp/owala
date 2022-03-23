import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:geolocator/geolocator.dart';
import 'package:owalaapp/components/elevatedPrimaryButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/constants/constants.dart';
import '../constants/customtheme.dart';

class LocationPersmissionScreen extends StatefulWidget {
  const LocationPersmissionScreen({Key? key}) : super(key: key);

  @override
  State<LocationPersmissionScreen> createState() =>
      _LocationPersmissionScreenState();
}




class _LocationPersmissionScreenState extends State<LocationPersmissionScreen> {

// Will store the position once you fetch it
  Position? _position;

  void _getCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();


    if(permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }

    else {
      
    }
    }

    return await Geolocator.getCurrentPosition();
  }


    @override
    void initState() {
    super.initState();
    _getCurrentLocation();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               SvgPicture.asset(
                'images/locationPerm.svg',
                width: 125.0,
              ),
                 SizedBox(
                  height: centreIllustrationWidth,
                ),
                Text('Welcome',
                style: TextStyle(
                  fontSize: h4FontSize,
                  fontWeight: FontWeight.bold,
                ),),
             
                Text(
                    'Please enable location permission\nfor a better delivery experience.',
                    textAlign: TextAlign.center,
                  
                    ),

                SizedBox(
                  height: 50.0,
                ),

                ElevatedButton(onPressed: _getCurrentLocation,
                 child: Text("Allow Location")),
                 Center(
        child: _position != null ? Text('Current Location: ' + _position.toString()) : Text('No Location Data'),
      ),
                          ],

            ),
          ),
        ),
      ),
    );
  }
}
