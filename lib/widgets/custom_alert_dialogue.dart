import 'package:flutter/material.dart';

class CustomAlertDialogue extends StatelessWidget {
  final String label;
  final String text;
  const CustomAlertDialogue({Key key, this.label, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5.0,
        child: Column(
          children: <Widget>[
            Text(label),
            
            
          ],
        ),
      ),
    );
  }
}
