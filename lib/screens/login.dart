import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_validator/form_validator.dart';
import 'package:owalaapp/components/elevatedPrimaryButton.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owalaapp/constants/customtheme.dart';
import 'package:owalaapp/screens/location-permission.dart';
import 'package:owalaapp/screens/terms-conditions.dart';

enum MobileVerificationState { SHOW_MOBILE_FORM_STATE, SHOW_OTP_FORM_STATE }

MobileVerificationState currentState =
    MobileVerificationState.SHOW_MOBILE_FORM_STATE;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState
      // .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  SafeArea getMobileFormWidget(context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/owalaGreenLogo.png"),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Ab',
                      style: ourConditonsText(
                          FontWeight.normal, FontStyle.italic, h5FontSize)),
                  TextSpan(
                      text: ' Shop ',
                      style: ourConditonsText(
                          FontWeight.bold, FontStyle.italic, h5FontSize)),
                  TextSpan(
                      text: '& shopping,\n',
                      style: ourConditonsText(
                          FontWeight.normal, FontStyle.italic, h5FontSize)),
                  TextSpan(
                      text: 'dono',
                      style: ourConditonsText(
                          FontWeight.normal, FontStyle.italic, h5FontSize)),
                  TextSpan(
                      text: ' ghar par!',
                      style: ourConditonsText(
                          FontWeight.bold, FontStyle.italic, h5FontSize)),
                  TextSpan(
                      text: '',
                      style: ourConditonsText(
                          FontWeight.bold, FontStyle.normal, h5FontSize))
                ]),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Center(
              child: Text(
                "India's #1st Cart\nHailing App",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w900, fontSize: h5FontSize),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(child: Text("Login on Sign up with")),
            SizedBox(
              height: 20.0,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // Only numbers can be entered
                      validator: ValidationBuilder()
                          .minLength(10, "Please enter correct phone number")
                          .maxLength(10, 'Please enter correct phone number')
                          .build(),

                      decoration: InputDecoration(
                          prefixIcon: Image.asset('images/indianFlag.png'),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // borderSide: BorderSide(color: Colors.grey[200])
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // borderSide: BorderSide(color: Colors.grey[300])
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          hintText: "Mobile Number"),
                      // controller: _phoneController,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: primaryBtnWidth,
                          height: primaryBtnHeight,
                          child: ElevatedButton(
                            child: Text(
                              "Continue",
                              style: ourPrimaryButtonStyle(),
                            ),
                            onPressed: () async {
                              
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  userPhoneNumber =
                                      int.parse(phoneController.text);
                                  showLoading = true;
                                });

                                await _auth.verifyPhoneNumber(
                                  phoneNumber: '+91' + phoneController.text,
                                  verificationCompleted:
                                      (phoneAuthCredential) async {
                                    setState(() {
                                      showLoading = false;
            });
                                    //signInWithPhoneAuthCredential(phoneAuthCredential);
                                  },
                                  verificationFailed:
                                      (verificationFailed) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    // _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    // content: Text(verificationFailed.message)));
                                  },
                                  codeSent:
                                      (verificationId, resendingToken) async {
                                    setState(() {
                                      showLoading = false;
                                      currentState = MobileVerificationState
                                          .SHOW_OTP_FORM_STATE;
                                      this.verificationId = verificationId;
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (verificationId) async {},
                                );
                                //   final snackBar =
                                //       SnackBar(content: Text("Submi"));
                                //   _scaffoldKey.currentState!.showSnackBar(snackBar);
                                // }

                              }
                            },
                          ),
                          // ourElevatedPrimaryBtn(
                          //      context, getOtpFormWidget(context), "Continue"),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'By continuing, you agree to our\n',
                        style: ourConditonsText(FontWeight.normal,
                            FontStyle.normal, body1FontSize)),
                    TextSpan(
                        text: ' Terms & Conditions ',
                        style: ourConditonsText(
                            FontWeight.bold, FontStyle.normal, body1FontSize)),
                    TextSpan(
                        text: 'and',
                        style: ourConditonsText(FontWeight.normal,
                            FontStyle.normal, body1FontSize)),
                    TextSpan(
                        text: ' Privacy Policy',
                        style: ourConditonsText(
                            FontWeight.bold, FontStyle.normal, body1FontSize)),
                    TextSpan(
                        text: '.',
                        style: ourConditonsText(
                            FontWeight.normal, FontStyle.normal, body1FontSize))
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SafeArea getOtpFormWidget(context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
                  MaterialPageRoute(builder: (context) => (LoginScreen()));
                });
              },
              child: Container(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, color: primaryColor),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            SvgPicture.asset(
              'images/otp-verification-ill.svg',
              width: 125.0,
            ),
            Text('We’ve sent a verification code to'),
            Text(
              '+91 $userPhoneNumber',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextFormField(
                controller: otpController,
                decoration: InputDecoration(hintText: 'Enter OTP')),
            SizedBox(
              height: 50.0,
            ),
            SizedBox(
              width: primaryBtnWidth,
              height: primaryBtnHeight,
              child: ElevatedButton(
                onPressed: () async {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: otpController.text);

                  signInWithPhoneAuthCredential(phoneAuthCredential);
                  
                },
                child: Text(
                  'VERIFY',
                  style: ourPrimaryButtonStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }

  TextStyle ourConditonsText(weight, ourFontStyle, ourFontSize) {
    return TextStyle(
        color: Colors.black,
        fontWeight: weight,
        fontSize: ourFontSize,
        fontStyle: ourFontStyle);
  }
}
