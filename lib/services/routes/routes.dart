import 'package:flutter/material.dart';
import 'package:market40Master/screens/key_Screen.dart';
import 'package:market40Master/screens/receipt_screen.dart';
import 'package:market40Master/screens/register_screen.dart';
import 'package:market40Master/screens/sign_in_screen.dart';
import 'package:market40Master/services/models/user_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/receipt':
      if (args is User) {
          return MaterialPageRoute(
              builder: (_) => ReceiptScreen(
                    user: args,
                  ));
        }
        return _errorRoute();
      case '/key':
        if (args is User) {
          return MaterialPageRoute(
              builder: (_) => KeyScreen(
                    user: args,
                  ));
        }
        return _errorRoute();
    }
  }
   static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
