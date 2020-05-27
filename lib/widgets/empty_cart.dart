import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children :<Widget>[
          Text("You don't have any receipts yet", style: TextStyle(color: Colors.white, fontSize: 25),),
          Flexible(child: SvgPicture.asset('assets/svg/undraw_empty_cart.svg'))
        ],
      ),
    );
  }
}