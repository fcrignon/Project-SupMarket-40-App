import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market40Master/utils/style/constants.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: Container(
              height: 40,
              decoration: kContainerStyle,
              child: Center(
                child: Text("You don't have any receipts yet",
                    style: kTitleTextStyleGreen),
              ),
            ),
          ),
          Flexible(
              child: SvgPicture.asset('assets/svg/undraw_empty_cart.svg'))
        ],
      ),
    );
  }
}
