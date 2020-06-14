import 'package:flutter/material.dart';


final ThemeData marketThemeData = new ThemeData(
  brightness: Brightness.light,
  //primarySwatch: MarketColors.applegreen[600],
  primaryColor: MarketColors.applegreen[500],
  primaryColorBrightness: Brightness.dark,
  primaryColorLight: MarketColors.applegreen[600],
  accentColor: MarketColors.cyanblue[500],
  //accentColorBrightness: Brightness.dark,
  textTheme: TextTheme(
    //headline1: TextStyle(color:Colors.white) ,
    //bodyText1: TextStyle(color: Colors.white,),
    //bodyText2: TextStyle(color: Colors.black45,),
    //bodyText2: TextStyle(color: Colors.white,)
  ),
  
  
  
  fontFamily: 'Roboto',
);

class MarketColors {
  MarketColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> applegreen = const <int, Color> {
    50: const Color(0xFFe6fbee),
    100: const Color(0xFFbff5d5),
    200: const Color(0XFF95EFB9),
    300: const Color(0XFF6BE89D),
    400: const Color(0xFF4BE388),
    500: const Color(0xFF2BDE73),
    600: const Color(0xFF26DA6B),
    700: const Color(0xFF20D560),
    800: const Color(0xFF1AD156),
    900: const Color(0xFF10C843)
  };
  
  static const Map<int, Color> cyanblue = const <int, Color> {
    50: const Color(0xFFE5F4F3),
    100: const Color(0xFFBEE4E1),
    200: const Color(0xFF93D3CD),
    300: const Color(0xFF67C1B8),
    400: const Color(0xFF47B3A9),
    500: const Color(0xFF26A69A),
    600: const Color(0xFF229E92),
    700: const Color(0xFF1C9588),
    800: const Color(0xFF178B7E),
    900: const Color(0xFF0D7B6C)
  };
   static const Map<int, Color> bluegray = const <int, Color> {
    50: const Color(0xFFEAECEE),
    100: const Color(0xFFCACED6),
    200: const Color(0xFFA7AEBA),
    300: const Color(0xFF848E9E),
    400: const Color(0xFF69758A),
    500: const Color(0xFF4F5D75),
    600: const Color(0xFF48556D),
    700: const Color(0xFF3F4B62),
    800: const Color(0xFF364158),
    900: const Color(0xFF263045)
  };
   static const Map<int, Color> simplegrey = const <int, Color> {
    50: const Color(0xFFF7F7F7),
    100: const Color(0xFFECECEC),
    200: const Color(0xFFDFE0E0),
    300: const Color(0xFFD2D3D3),
    400: const Color(0xFFC9C9C9),
    500: const Color(0xFFBFC0C0),
    600: const Color(0xFFB9BABA),
    700: const Color(0xFFB1B2B2),
    800: const Color(0xFFA9AAAA),
    900: const Color(0xFF9B9C9C)
  };
   static const Map<int, Color> carbon = const <int, Color> {
    50: const Color(0xFFE6E6E8),
    100: const Color(0xFFC0C1C6),
    200: const Color(0xFF9698A1),
    300: const Color(0xFF6C6F7B),
    400: const Color(0xFF4D505E),
    500: const Color(0xFF2D3142),
    600: const Color(0xFF282C3C),
    700: const Color(0xFF222533),
    800: const Color(0xFF1C1F2B),
    900: const Color(0xFF11131D)
  };
   static const Map<int, Color> rederror = const <int, Color> {
    50: const Color(0xFFFCE7E9),
    100: const Color(0xFFF8C4C8),
    200: const Color(0xFFF39CA3),
    300: const Color(0xFFEE747E),
    400: const Color(0xFFEA5762),
    500: const Color(0xFFE63946),
    600: const Color(0xFFE3333F),
    700: const Color(0xFFDF2C37),
    800: const Color(0xFFDB242F),
    900: const Color(0xFFD51720)
  };
}