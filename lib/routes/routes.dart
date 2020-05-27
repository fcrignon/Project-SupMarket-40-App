import 'package:flutter/material.dart';
import 'package:market40Master/screens/key_Screen.dart';
import 'package:market40Master/screens/receipt_screen.dart';
import 'package:market40Master/screens/register_screen.dart';
import 'package:market40Master/screens/sign_in_screen.dart';

final routes = {
  '/register':         (BuildContext context) => new RegisterScreen(),
   '/key':         (BuildContext context) => new KeyScreen(),
  '/receipt':         (BuildContext context) => new ReceiptScreen(),
  '/' :          (BuildContext context) => new SignInScreen(),
};