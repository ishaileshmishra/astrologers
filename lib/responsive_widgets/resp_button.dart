import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  const ResponsiveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.maxFinite,
        child: Chip(
          labelPadding: EdgeInsets.all(10.0),
          avatar: CircleAvatar(
            backgroundColor: Colors.red,
            child: Icon(
              Icons.auto_delete,
              color: Colors.yellow,
            ),
          ),
          label: Text(
            'Dismiss',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.red,
          elevation: 5.0,
          shadowColor: Colors.amber,
          padding: EdgeInsets.all(10.0),
        ));
  }
}
