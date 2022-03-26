import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/components/dividers.dart';

import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/ouricons.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/components/logoappbar.dart';

// SCREENS
import 'package:owalaapp/screens/address.dart';
import 'package:owalaapp/screens/location-permission.dart';
import 'package:owalaapp/screens/sidemenu.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  final String userLocationValue;
  const HomeScreen({
    Key? key,
    required this.userLocationValue,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool askForName = true;
bool gotUserLocation = false;
bool accountCreatedSuccessfully = false;

class _HomeScreenState extends State<HomeScreen> {
  int ourCurrentIndex = 0;
  final _formAskNameKey = GlobalKey<FormState>();
  final userNameGot = TextEditingController();

  @override
  void initState() {
    // if (askForName == true) {
    //   Future.delayed(Duration.zero).then((value) {
    //     if (askForName) {
    //       // openDialog();
    //       askForName = false;
    //     }
    //     askForName = false;
    //   });
    // }

    if (gotUserLocation == ', , , ...') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LocartionPermSc()));
    } else {
      gotUserLocation = true;
    }

    super.initState();
  }

  // Map locationShowDa = 'FETCHING';

  // Map locationShowDa = {};

  @override
  Widget build(BuildContext context) {
    // locationShowDa = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: logoAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightLayoutPadding,
              vertical: topBottomLayoutPadding),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocartionPermSc()));
                  },
                  child: Row(
                    children: [
                      ourPrimaryIcon(locationIcon, primaryColor),
                      SizedBox(
                        width: spacer1,
                      ),
                      Container(
                        width: 200.0,
                        child: gotUserLocation
                            ? Text(
                                widget.userLocationValue,
                                overflow: TextOverflow.ellipsis,
                              )
                            : Text('fetching...'),
                      ),

                      // if(gotUserLocation == false){
                      // asLocationFinder();

                      // }
                    ],
                  ),
                ),
                GestureDetector(
                  child: ourPrimaryIcon(sideMenuIcon, defaultIconColor),
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SideMenu()))
                  },
                )
              ]),
              SizedBox(
                height: spacer1,
              ),
              SvgPicture.asset(homeTopBanner),
              SizedBox(
                height: spacer3,
              ),
              ourCTA(productaCartCta, '$productAName Cart', productADescription,
                  productACartServiceCharge, true),
              SizedBox(
                height: spacer2,
              ),
              ourCTA(productbCartCta, '$productBName Cart', productBDescription,
                  productBCartServiceCharge, false),
              SizedBox(
                height: spacer1,
              ),
              ourDividerA(),
              ourSectionTitles("Offers"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ourHomeOffers(offerAImgHome),
                  ourHomeOffers(offerBImgHome),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded ourHomeOffers(ourImage) {
    return Expanded(
      child: SvgPicture.asset(
        ourImage,
      ),
    );
  }

  InkWell ourCTA(ourImage, ourTitle, ourSubTitle, charges, availbale) {
    return InkWell(
      child: Card(
        elevation: 2,
        child: ListTile(
          onTap: () {
            if (availbale) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddAddressScreen()),
              );
            }
          },
          leading: Image.asset(ourImage),
          title: Text(ourTitle),
          subtitle: Text(ourSubTitle),
          trailing: Text('Rs.$charges'),
        ),
      ),
    );
  }

  // Future openDialog() => showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Form(
  //           key: _formAskNameKey,
  //           child: AlertDialog(
  //             actions: [
  //               TextButton(
  //                   onPressed: () {
  //                     if (_formAskNameKey.currentState!.validate()) {
  //                       setState(() {
  //                         userName = userNameGot.text.toString();

  //                         Navigator.of(context, rootNavigator: true)
  //                             .pop('dialog');
  //                       });
  //                     }
  //                   },
  //                   child: Text("Let's Start"))
  //             ],
  //             title: Text("You're ready. 👍"),
  //             content: TextFormField(
  //               validator: ValidationBuilder()
  //                   .minLength(2, 'Please enter valid name')
  //                   .maxLength(20, 'Please enter valid name')
  //                   .build(),
  //               controller: userNameGot,
  //               decoration: InputDecoration(hintText: 'Enter your full name'),
  //             ),
  //           ),
  //         ));

  // Future creatUser({required String userName}) async {

  // Read data from firebase
  // Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) => snapshot.docs.map((doc) => ).toList());

}
