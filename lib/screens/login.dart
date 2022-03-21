import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owalaapp/screens/otp-verification.dart';
import 'package:owalaapp/components/elevatedPrimaryButton.dart';
import 'package:owalaapp/screens/home.dart';
import 'package:flutter_svg/flutter_svg.dart';



enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE, 
  SHOW_OTP_FORM_STATE
}

final phoneController = TextEditingController();
final otpController = TextEditingController();


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;


  SafeArea getOtpFormWidget(context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              decoration :InputDecoration(
                hintText : 'Enter OTP'
              )
              ),
              SizedBox(
                height: 50.0,
              ),
              SizedBox(
                width: primaryBtnWidth,
                height: primaryBtnHeight,
                child: ourElevatedPrimaryBtn(context, HomeScreen(), "Verify"),
              ),
            ],
          ),
        ),
      ),
    );
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
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ], // Only numbers can be entered
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
                hintText: "Phone Number"),
            // controller: _phoneController,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: primaryBtnWidth,
                height: primaryBtnHeight,
                // child: ourElevatedPrimaryBtn(
                //     context, getOtpFormWidget(context), "Continue"),
              ),
            ),
          ),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE ? getMobileFormWidget(context) : getOtpFormWidget(context));
  }


   TextStyle ourConditonsText(weight, ourFontStyle, ourFontSize) {
    return TextStyle(
        color: Colors.black,
        fontWeight: weight,
        fontSize: ourFontSize,
        fontStyle: ourFontStyle);
  }
}



