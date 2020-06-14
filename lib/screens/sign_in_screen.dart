import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:market40Master/services/input_validator.dart';
import 'package:market40Master/services/models/user_model.dart';
import 'package:market40Master/services/network/api_market_40.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/utils/style/market_40_palette.dart';
import 'package:market40Master/widgets/custom_alert_dialogue.dart';
import 'package:market40Master/widgets/rounded_gradiant_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // Create storage for jwt
  final storage = new FlutterSecureStorage();
  final _formKey = GlobalKey<FormState>();
  bool isHided = true;
  String _email;
  String _password;

  Market40Api api = Market40Api();
  Validator validator = Validator();

  void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) => CustomAlertDialogue(
            label: title,
            content: text,
          ));

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
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    child:
                        Image.asset('assets/images/Market40LogoExtended.png'),
                  ),
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
                          style: kTitleSignInUpStyle,
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
                                  labelStyle: kTextformFieldTextStyle,
                                  labelText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                maxLength: 32,
                                onSaved: (String value) =>
                                    setState(() => _email = value.trim()),
                                validator: validator.emailValidator,
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
                                  labelStyle: kTextformFieldTextStyle,
                                  labelText: 'Password',
                                ),
                                obscureText: isHided,
                                maxLength: 32,
                                onSaved: (String value) =>
                                    setState(() => _password = value.trim()),
                                validator: validator.passwordvalidator,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //flat button for reseting you password
                      // FlatButton(
                      //   onPressed: null,
                      //   child: Text("Forgot password?"),
                      // ),
                      //button for validating the input and SignIn
                      RoundedGradientButton(
                          label: 'SignIn',
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate() == true) {
                              var res = await api.signInUser(_email, _password);
                              if (res == 404) {
                                displayDialog(context, "User unknow",
                                    "No account was found matching that email");
                              } else if (res == 401) {
                                displayDialog(context, "Wrong password",
                                    "Your account was found but the password doesn't match");
                              } else {
                                var decodedRes = json.decode(res);
                                storage.write(
                                    key: 'jwt', value: decodedRes['token']);
                                storage.write(
                                    key: 'id', value: decodedRes['id']);
                                var data = await api.fetchUserData();
                                User user = User.fromJson(json.decode(data));

                                Navigator.pushNamed(context, '/key',
                                    arguments: user);
                              }
                            }
                          }),
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
