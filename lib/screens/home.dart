import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:owalaapp/components/logoappbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:owalaapp/constants/user.dart';
import 'package:owalaapp/components/section-titles.dart';
import 'package:owalaapp/screens/address.dart';

// SCREENS
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:owalaapp/screens/confirm-location.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool askForName = true;

class _HomeScreenState extends State<HomeScreen> {

  int ourCurrentIndex = 0;
  final _formAskNameKey = GlobalKey<FormState>();
  final userNameGot = TextEditingController();

  @override
  void initState() {
    if (askForName == true) {
      Future.delayed(Duration.zero).then((value) {
        if (askForName) {
          openDialog();
          askForName = false;
        }
        askForName = false;
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      userDeliveryArea,
                    ),
                  ],
                ),
                GestureDetector(
                  child: Icon(
                    Icons.menu,
                    size: spacer3,
                    color: iconColorGrey,
                  ),
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
              ourCTA('vegetable-cart', '$productAName Cart',
                  productADescription, vegetableCartServiceCharge, true),
              SizedBox(
                height: spacer2,
              ),
              ourCTA('fruitCart', '$productBName Cart', productBDescription,
                  fruitsCartServiceCharge, false),
              SizedBox(
                height: spacer3 + spacer2,
              ),
              ourSectionTitles("Offers"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ourHomeOffers('offer-a.svg'),
                  ourHomeOffers('offer-b.svg'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox ourHomeOffers(ourImage) {
    return SizedBox(
      width: 170.0,
      child: SvgPicture.asset(
        'images/$ourImage',
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
          leading: Image.asset('images/$ourImage.png'),
          title: Text(ourTitle),
          subtitle: Text(ourSubTitle),
          trailing: Text('Rs.$charges'),
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Form(
            key: _formAskNameKey,
            child: AlertDialog(
              actions: [
                TextButton(
                    onPressed: () {
                      if (_formAskNameKey.currentState!.validate()) {
                        setState(() {
                          userName = userNameGot.text.toString();
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                        });
                      }
                    },
                    child: Text("Let's Start"))
              ],
              title: Text("You're ready. 👍"),
              content: TextFormField(
                validator: ValidationBuilder()
                    .minLength(2, 'Please enter valid name')
                    .maxLength(20, 'Please enter valid name')
                    .build(),
                controller: userNameGot,
                decoration: InputDecoration(hintText: 'Enter your full name'),
              ),
            ),
          ));
}
