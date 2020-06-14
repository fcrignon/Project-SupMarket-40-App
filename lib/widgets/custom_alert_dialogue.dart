import 'package:flutter/material.dart';

class CustomAlertDialogue extends StatelessWidget {
  final String label;
  final String content;
  const CustomAlertDialogue({Key key, this.label, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  Divider(),
                  Text(content, style: TextStyle(fontSize: 18))
                  
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
