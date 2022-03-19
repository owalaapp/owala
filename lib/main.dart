import 'package:flutter/material.dart';
import 'package:owalaapp/constants/customtheme.dart';
import 'package:owalaapp/screens/terms-conditions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/terms-conditions.dart';
import 'constants/constants.dart';
import 'package:material_color_generator/material_color_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: generateMaterialColor(color: primaryColor),
          fontFamily: 'Poppins',

          // fontFamily: 'Montserrats',
          textTheme: TextTheme(
              bodyText2:
                  TextStyle(fontSize: 16.0, fontFamily: primaryFontFamily)),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

