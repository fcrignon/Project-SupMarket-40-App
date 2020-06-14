import 'package:flutter/material.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';
// import 'package:market40Master/style/market_40_palette.dart';

const kButtonLabelStyle =
    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

MarketColors appleGreen600 = MarketColors.applegreen[600] as MarketColors;

const kGreenGradient = LinearGradient(
  begin: FractionalOffset.topRight,
  end: FractionalOffset.bottomRight,
  tileMode: TileMode.clamp,
  colors: [
    //applegreen[600]
    Color(0xFF2BDE73),
    //applegreen[500]
    Color(0xFF26DA6B),
    //applegreen[400]
    Color(0xFF4BE388),
    //applegreen[300]
    Color(0XFF6BE89D),
    //Color(0XFF6BE89D)
  ],
);
const kDarkGreenGradient = LinearGradient(
  begin: Alignment.topCenter,
  colors: [
    Color(0xFF2BDE73),
    Color(0xFF20D560),
    Color(0xFF1AD156),
    //Color(0xFF2D3142),
    //Color(0xFF282C3C),
    Color(0xFF222533),
    //Color(0XFF6BE89D)
  ],
);

const kContainerShadow = [
  BoxShadow(
    color: Colors.black45,
    blurRadius: 5.0,
    spreadRadius: 0.0,
    offset: Offset(5.0, 5.0),
  )
];
const kContainerStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(50)),
  boxShadow: kContainerShadow,
);

const kAppBarTitle = TextStyle(color: Colors.white, fontSize: 24);

const kDrawerTextStyle = TextStyle(fontSize: 18.0);

const kTextformFieldTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

const kTitleSignInUpStyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2BDE73));

const kTableTitleTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

const kTableItemsTextStyle = TextStyle(
  fontSize: 16,
);
const kTitleTextStyle = TextStyle(color: Colors.white, fontSize: 24);

const kTitleTextStyleGreen = TextStyle(color: Color(0xFF2BDE73), fontSize: 24);

const kTotalPriceTextStyle =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
