import 'package:flutter/material.dart';
import 'package:market40Master/routes/routes.dart';
import 'package:market40Master/style/market_40_palette.dart' as Theme;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
   MyApp({Key key}) : super(key: key);
  // This widget is the root the application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.marketThemeData,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
