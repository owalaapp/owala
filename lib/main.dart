import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'package:owalaapp/screens/location-permission.dart';

import 'constants/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: generateMaterialColor(color: primaryColor),
          fontFamily: 'Poppins',
        ),
        home: LocartionPermSc());
  }
}
