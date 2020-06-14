import 'package:flutter/material.dart';
import 'package:market40Master/utils/style/constants.dart';

class RoundedGradientButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const RoundedGradientButton({
    Key key,
    @required this.label,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: RaisedButton(
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: kGreenGradient,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: kButtonLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
