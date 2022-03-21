import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owalaapp/main.dart';

final _auth = FirebaseAuth.instance;


  AlertDialog OurAlertDialog(BuildContext context, ourTitle, ourContent) {
    return AlertDialog(
        title:  Text(ourTitle),
        content: Text(ourContent),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
             onPressed: () async {
                  await _auth.signOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
            // onPressed: () => Navigator.pop(context, 'Yes'),
            child: const Text('Yes',
            style: TextStyle(
              color: Colors.black
            ),),
          ),
        ],
      );
  }
