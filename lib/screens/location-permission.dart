import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/screens/login.dart';
import 'package:owalaapp/screens/nodeliverylocation.dart';


class LocartionPermSc extends StatefulWidget {
  const LocartionPermSc({Key? key}) : super(key: key);

  @override
  _LocartionPermSc createState() => _LocartionPermSc();
}

class _LocartionPermSc extends State<LocartionPermSc> {

@override
void initState()  {
    super.initState();
    asLocationFinder();

  }

void asLocationFinder() async {
    Position position = await _getGeoLocationPosition();
    userLatitude = position.latitude;
    userLongitude = position.longitude;

              location ='Lat: ${userLatitude} Lon: ${userLongitude} , Long: $userLatitude';
              GetAddressFromLatLong(position);
} 


  String location ='Null, Press Button';
  String Address = 'search';

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

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    userPincode = place.postalCode.toString();

    if(userPincode != '122001'){
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => LocationNotServicable()));
    }

    else {
       Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
            SizedBox(height: 10,),
            Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('${Address}'),
            Text('Pincode : $userPincode')
         
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/parser.dart';
// import 'package:geolocator/geolocator.dart';
// // import 'package:geocoder/geocoder.dart';
// import 'package:owalaapp/components/elevatedPrimaryButton.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:owalaapp/constants/constants.dart';
// import '../constants/customtheme.dart';

// class LocationPersmissionScreen extends StatefulWidget {
//   const LocationPersmissionScreen({Key? key}) : super(key: key);

//   @override
//   State<LocationPersmissionScreen> createState() =>
//       _LocationPersmissionScreenState();
// }




// class _LocationPersmissionScreenState extends State<LocationPersmissionScreen> {

// // Will store the position once you fetch it
//   Position? _position;
//   String userLocation = 'My Address';
//   String add1 = '';
//   String add2 = '';

//   void _getCurrentLocation() async {
//     Position position = await _determinePosition();
//     setState(() {
//       _position = position;
//     });
//   }
  

//     getAdressBasedOnLocation() async { 
//       // final coordinates =  new Coordinates(12.982030, 77.593540);
//       // var address = await Geocoder.local.findAddressesFromCoordinates(coordinates);
     
//      setState(() {
       
//       // add1 = address.first.featureName;
//       // add2 = address.first.addressLine;
//      });
//     }


//   Future<Position> _determinePosition() async {
//     LocationPermission permission;

//     permission = await Geolocator.checkPermission();


//     if(permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if(permission == LocationPermission.denied) {
//         return Future.error('Location Permissions are denied');
//       }

//     else {
      
//     }
//     }

//     return await Geolocator.getCurrentPosition();
//   }


//     @override
//     void initState() {
//     super.initState();
//     _getCurrentLocation();
//   } 

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                SvgPicture.asset(
//                 'images/locationPerm.svg',
//                 width: 125.0,
//               ),
//                  SizedBox(
//                   height: centreIllustrationWidth,
//                 ),
//                 Text('Welcome',
//                 style: TextStyle(
//                   fontSize: h4FontSize,
//                   fontWeight: FontWeight.bold,
//                 ),),
             
//                 Text(
//                     'Please enable location permission\nfor a better delivery experience.',
//                     textAlign: TextAlign.center,
                  
//                     ),

//                 SizedBox(
//                   height: 50.0,
//                 ),

//                 ElevatedButton(onPressed: _getCurrentLocation,
//                  child: Text("Allow Location")),
//                  Center(child: 
//                  Text(userLocation),
//                  ),

//                  Center(
//                             child : Text(add1)

//         // child: _position != null ? Text('Current Location: ' + _position.toString()) : Text('No Location Data'),
//       ),

//       Column (children: [
//         Text(add1),
//                 Text(add2),


//       ],)
//                           ],

//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
