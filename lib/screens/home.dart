import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:owalaapp/screens/about-us.dart';
import 'package:geolocator/geolocator.dart';
import 'package:owalaapp/screens/customer-support.dart';
import 'package:owalaapp/screens/terms-conditions.dart';
import 'package:owalaapp/components/bottombar.dart';
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'about-us.dart';
import 'package:owalaapp/constants/constants.dart';
import 'confirm-location.dart';
import 'package:owalaapp/components/section-titles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int ourCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: backToast,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset('images/owalaWhiteLogo.png'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
              child: Column(
                children: [
                  Row(children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Delivery in $deliveryTime minutes",
                    ),
                    SizedBox(
                      width: 85.0,
                    ),
                    GestureDetector(
                      child: Icon(Icons.menu,
                      size: 40.0,
                      color: Colors.grey,
                      ),
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SideMenu()))
    
                    },
          
                    
                    
                    )
                  ]),
                  SizedBox(
                    height: 20.0,
                  ),
                  SvgPicture.asset('images/homeTopBannerA.svg'),
                  SizedBox(
                    height: 40.0,
                  ),
                  ourCTA(
                      'vegetable-cart',
                      'Vegetable Cart',
                      'Get fresh & hygenic vegetables.',
                      vegetableCartServiceCharge),
                  SizedBox(
                    height: 20.0,
                  ),
                  ourCTA(
                      'fruitCart',
                      'Fruits Cart',
                      'Get seasonal & juicy fruits at door',
                      fruitsCartServiceCharge),
                  SizedBox(
                    height: 40.0,
                  ),
                  // ourSectionTitles("Around you"),
                  Container(
                      // child: _position != null ? Text('Current Location: ' + _position.toString()) : Text('No Location Data'),
                      ),
                  ourSectionTitles("Offers"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ourHomeOffers('offer-a.svg'),
                      ourHomeOffers('offer-b.svg'),
                    ],
                  )
                ],
              ),
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: ourCurrentIndex,
          //   items: [
          //     ourBottomNavigation(ourIcon: Icon(Icons.home), ourLabel: 'home'),
          //     ourBottomNavigation(
          //         ourIcon: Icon(Icons.feedback), ourLabel: 'contact us'),
          //     ourBottomNavigation(
          //         ourIcon: Icon(Icons.account_circle), ourLabel: 'account'),
          //   ],
          //   onTap: (index) {
          //     setState(() {
                
                
          //         if (ourCurrentIndex == 0) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => HomeScreen()),
          //           );
          //         }
    
    
          //         if (ourCurrentIndex == 1) {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => CustomerSupportScreen()),
          //           );
          //         }
    
    
          //       ourCurrentIndex = index;
          //       if (ourCurrentIndex == 2) {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => SideMenu()),
          //         );
          //       }
    
                
          //     });
          //   },
          // )
          ),
    );

  }

   SizedBox ourHomeOffers(ourImage) {
    return SizedBox(width: 171.0, child: SvgPicture.asset('images/$ourImage'));
  }

  Card ourCTA(ourImage, ourTitle, ourSubTitle, charges) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ConfirmCurrentLocationScreen()),
          );
        },
        leading: Image.asset('images/$ourImage.png'),
        title: Text(ourTitle),
        subtitle: Text(ourSubTitle),
        trailing: Text('Rs.$charges'),
      ),
    );
  }
}














 