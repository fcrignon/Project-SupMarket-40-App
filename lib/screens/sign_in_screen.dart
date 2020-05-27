import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market40Master/constants.dart';
import 'package:market40Master/style/market_40_palette.dart';
import 'package:market40Master/widgets/rounded_gradiant_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isHided = true;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: kGreenGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Container(
                  //child: Image.asset('assets/images/Market40Logo.png'),
                  child: SvgPicture.asset('assets/svg/Market40Logo.svg')
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: kContainerShadow,
                  ),
                  child: Column(
                    children: <Widget>[
                      // logo
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Welcome, please sign in',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //Email form field
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.mail),
                                  hintText: 'Enter your email',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 32,
                                onSaved: (String value) {
                                  email = value.trim();
                                },
                              ),
                            ),
                            //Passwor form field
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                      icon: Icon(isHided
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          isHided
                                              ? isHided = false
                                              : isHided = true;
                                        });
                                      }),
                                  hintText: 'Enter your password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  labelText: 'Password',
                                ),
                                obscureText: isHided,
                                maxLength: 32,
                                onSaved: (String value) {
                                  password = value.trim();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      //flat button for reseting you password
                      FlatButton(
                        onPressed: null,
                        child: Text("Forgot password?"),
                      ),
                      //button for validating the input and SignIn
                      Hero(tag: 'heroOne',
                      child: RoundedGradientButton(label: 'SignIn', onPressed: () {
                        Navigator.pushNamed(context, '/key');
                      })),
                      //flat button for passing to the register screen
                      FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: RichText(
                            text: TextSpan(
                          text: "Don't have an acount? ",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register Now!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: MarketColors.applegreen[600]),
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
