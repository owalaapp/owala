import 'package:flutter/material.dart';
import 'package:owalaapp/screens/about-us.dart';
import 'package:owalaapp/screens/customer-support.dart';
import 'package:owalaapp/screens/terms-conditions.dart';
import 'package:owalaapp/temp.dart';
import 'package:owalaapp/components/bottombar.dart';
import 'package:owalaapp/screens/sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'about-us.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int ourCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/owalaWhiteLogo.png'),
      ),

        body: Row(children: [
        Icon(Icons.location_on),
        Text(
          "Delivery in $deliveryTime minutes",
        ),
      ]
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ourCurrentIndex,
        items: [
        ourBottomNavigation(ourIcon: Icon(Icons.home), ourLabel: 'home'),
        ourBottomNavigation(
            ourIcon: Icon(Icons.feedback), ourLabel: 'contact us'),
        ourBottomNavigation(
            ourIcon: Icon(Icons.account_circle), ourLabel: 'account'),
      ],

  
      onTap: (index){
        setState(() {
          ourCurrentIndex = index;
          if(ourCurrentIndex == 2){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  SideMenu()),
            );

    if(ourCurrentIndex == 1){
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  CustomerSupportScreen()),
            );

 
          }
        }});
      },


        )    );
  }
}
