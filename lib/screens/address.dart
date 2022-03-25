import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';


import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/user.dart';

// Screens
import 'package:owalaapp/screens/order-confirmed.dart';

class AddAddressScreen extends StatefulWidget {
  // const AddAddressScreen({ Key? key }) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _addressFormKey = GlobalKey<FormState>();

  final houseNumberContoller = TextEditingController();
  final apartmentNumberContoller = TextEditingController();
  final landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _addressFormKey,
      appBar: ourAppBar("Add address details", OrderConfirmedScreen()),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: leftRightPadding,
                  vertical: topBottomLayoutPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 150.0,
                      child: SvgPicture.asset(
                        'images/locationpin.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: spacer3,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: primaryColor,
                      ),
                      Text(
                        addAddressTopLocation,
                        style: TextStyle(
                            fontSize: h5FontSize, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(userCompleteAddress),
                  ),
                  SizedBox(
                    height: spacer1,
                  ),
                  Form(
                      key: _addressFormKey,
                      child: Column(
                        children: [
                          ourAddressDetailInputs('(HOUSE/ FLAT/ BLOCK NO.)',
                              Icons.home, houseNumberContoller),
                          ourAddressDetailInputs('(APARTMENT/ ROAD/ AREA',
                              Icons.home, apartmentNumberContoller),
                          ourAddressDetailInputs('Landmark', Icons.location_on,
                              landmarkController),
                        ],
                      )),
                  SizedBox(
                    height: spacer3,
                  ),
                  SizedBox(
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
                            setState(() {
                              notEvenSingleOrderYet = false;
                            });

                            userAddressFirstLineInput =
                                houseNumberContoller.text.toString();
                            userAddressSecondLineInput =
                                apartmentNumberContoller.text.toString();
                            userLandmarkInput =
                                landmarkController.text.toString();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderConfirmedScreen()));
                          }
                        }),
                    // child: ourElevatedPrimaryBtn(
                    //     context, OrderConfirmedScreen(), "Proceed"),
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
          .maxLength(20, "Please enter a valid address")
          .build(),
      decoration:
          InputDecoration(label: Text(ourLabelText), icon: Icon(ourIcon)),
    );
  }
}

// class AddAddressScreen extends StatelessWidget {
//   // const AddAddressScreen({Key? key}) : super(key: key);


//   @override
//   Widget build(BuildContext context) {
    
//   }

//   TextFormField ourAddressDetailInputs(ourLabelText, ourIcon) {
//     return TextFormField(
//       validator: ValidationBuilder().minLength(2, "Please enter a valid address").maxLength(20, "Please enter a valid address").build(),
//       decoration:
//           InputDecoration(label: Text(ourLabelText), icon: Icon(ourIcon)),
//     );
//   }
// }
