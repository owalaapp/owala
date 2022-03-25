import 'package:flutter/material.dart';
import 'package:owalaapp/components/appbar.dart';
import 'package:owalaapp/components/titleImageScreen.dart';
import 'package:owalaapp/constants/constants.dart';
import 'package:owalaapp/constants/products.dart';
import 'package:owalaapp/constants/user.dart';
import 'package:owalaapp/screens/order-confirmed.dart';
import 'package:owalaapp/screens/sidemenu.dart';

enum OrdersState { SHOW_RECENT_ORDER, SHOW_NO_ORDERS_YET }

// OrdersState currentState =
//     OrdersState.SHOW_NO_ORDERS_YET;

class RecentOrdersScreen extends StatefulWidget {
  // const RecentOrdersScreen({ Key? key }) : super(key: key);

  @override
  State<RecentOrdersScreen> createState() => _RecentOrdersScreenState();
}

class _RecentOrdersScreenState extends State<RecentOrdersScreen> {
  SafeArea noOrdersYetWidget(context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
            child: imageTitleScreenWidget('images/no-orders-yet.svg',
                "No orders yet", 'Place your first order')));
  }

  SafeArea RcentOrdersWidget(context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: leftRightPadding, vertical: topBottomLayoutPadding),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(width: 1.0, color: dividerColor)),
            child: ListTile(
              leading: Image.asset(productAimage),
            title: Text(userRecentOrderId.toString()),
            subtitle: Text(),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderConfirmedScreen()),
              );
            },
            ),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourAppBar("Recent Orders", SideMenu()),
      body: Container(
        child: notEvenSingleOrderYet
            ? noOrdersYetWidget(context)
            : RcentOrdersWidget(context),
      ),
    );
  }
}
