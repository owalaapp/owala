import 'package:flutter/material.dart';


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
            onPressed: () => Navigator.pop(context, 'Yes'),
            child: const Text('Yes',
            style: TextStyle(
              color: Colors.black
            ),),
          ),
        ],
      );
  }
