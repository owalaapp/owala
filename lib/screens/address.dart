import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';
import 'package:mailer/smtp_server.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/ourbuttonstyles.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/theimages.dart';
import 'package:mailer/mailer.dart';
import 'package:owalaapp/models/user.dart';
import 'package:owalaapp/screens/home.dart';
import 'login.dart';
import 'package:owalaapp/constants/user.dart';
import 'package:owalaapp/screens/location-permission.dart';

// Screens
import 'package:owalaapp/screens/order-confirmed.dart';

class AddAddressScreen extends StatefulWidget {
  // const AddAddressScreen({ Key? key }) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _addressFormKey = GlobalKey<FormState>();

  final userName = TextEditingController();
  final houseNumberContoller = TextEditingController();
  final apartmentNumberContoller = TextEditingController();
  final landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _addressFormKey,
      appBar: ourAppBar("Add address details",
          HomeScreen(userLocationValue: userDeliveryArea)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: leftRightLayoutPadding,
                  vertical: topBottomLayoutPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: spacer3,
                  ),
                  Center(
                    child: Container(
                      height: 150.0,
                      child: SvgPicture.asset(locationPermissionIll),
                    ),
                  ),
                  SizedBox(
                    height: spacer3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocartionPermSc()));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: primaryColor,
                        ),
                        Text(
                          addAddressTopLocation1,
                          style: TextStyle(
                              fontSize: h5FontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(addAddressTopLocation2),
                  ),
                  SizedBox(
                    height: spacer1,
                  ),
                  Form(
                      key: _addressFormKey,
                      child: Column(
                        children: [
                          ourAddressDetailInputs('full name'.toLowerCase(),
                              Icons.account_circle, userName),
                          ourAddressDetailInputs(
                              'HOUSE/ FLAT/ BLOCK NO.'.toLowerCase(),
                              Icons.home,
                              houseNumberContoller),
                          ourAddressDetailInputs(
                              'ROAD/ GALI /AREA /APARTMENT'.toLowerCase(),
                              Icons.home,
                              apartmentNumberContoller),
                          ourAddressDetailInputs(
                              'Landmark (eg.Opposite abc school)'.toLowerCase(),
                              Icons.location_on,
                              landmarkController),
                        ],
                      )),
                  SizedBox(
                    height: spacer3,
                  ),
                  Center(
                    child: SizedBox(
                      width: primaryBtnWidth,
                      height: primaryBtnHeight,
                      // child: ourElevatedPrimaryBtn(
                      //     context, OrderConfirmedScreen(), "Proceed"),

                      child: ElevatedButton(
                          child: Text(
                            "Proceed",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (_addressFormKey.currentState!.validate()) {
                              creatUser(DateFormat('dd-MM-yyyy KK:mm:ss a')
                                  .format(DateTime.now()));
                              setState(() {
                                notEvenSingleOrderYet = false;
                                userDeliveryAddressImp =
                                    '$userAddressFirstLineInput, $userAddressSecondLineInput, Near $userLandmarkInput,  $userSubLocality, $userCity, $userPincode, $userCountry';

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            OrderConfirmedScreen()));
                              });

                              userAddressFirstLineInput =
                                  houseNumberContoller.text.toString();
                              userAddressSecondLineInput =
                                  apartmentNumberContoller.text.toString();
                              userLandmarkInput =
                                  landmarkController.text.toString();
                            }
                          }),
                      // child: ourElevatedPrimaryBtn(
                      //     context, OrderConfirmedScreen(), "Proceed"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  TextFormField ourAddressDetailInputs(ourLabelText, ourIcon, ourController) {
    return TextFormField(
      controller: ourController,
      validator: ValidationBuilder()
          .minLength(2, "Please enter a valid address")
          .maxLength(30, "Please enter a valid address")
          .build(),
      decoration:
          InputDecoration(label: Text(ourLabelText), icon: Icon(ourIcon)),
    );
  }

  Future creatAnewOrder() async {
    // Reference to a document
    // final docOrder = FirebaseFirestore.instance.collection('users').
  }
  Future creatUser(String orderDateTime) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    // final json = {
    //   'name': name,
    //   'phone-number': userPhoneNumber,
    //   'pin-code': userPincode,
    //   'user-city': userCity,
    //   'country': userCountry,
    //   'date-joined': formattedDateJoined
    // };

    final user = User(
        id: docUser.id,
        recentOrderItem: 'Vegetable Cart',
        recentOrderDateTime: orderDateTime,
        // accountCreatedSuccessfully: askForName,
        lastOrderSuccessful: false,
        deliveryAddress: userDeliveryAddressImp,
        userFullName: userName.text.toString(),
        userPhoneNumber: userPhoneNumber.toString(),
        recentOrderStatus: 'ON THE WAY!',
        userPinCode: userPincode,
        userCountry: userCountry,
        recentOrderPrice: productACartServiceCharge,
        userDateJoined: userJoinedDateStart);

    final json = user.toJson();

    // Update specific field
    docUser.update({'account-created-succesfully': true});

    // askForName = false;
    // Create documant and write data to direbase
    await docUser.set(json);
  }
}
