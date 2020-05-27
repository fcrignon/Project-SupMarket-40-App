import 'package:flutter/material.dart';
import 'package:market40Master/constants.dart';
import 'package:market40Master/style/market_40_palette.dart';
import 'package:market40Master/widgets/rounded_gradiant_button.dart';
import 'package:market40Master/services/input_validator.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  bool isHided = true;
  String firstName;
  String lastName;
  String email;
  String password;
  String password2;

  Validator validator = Validator();

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
                  height: 150,
                  child: Image.asset('assets/images/Market40LogoBright.png'),
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
                          'Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MarketColors.applegreen[600]),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //First name form field
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Enter your first name',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  labelText: 'First name',
                                ),
                                maxLength: 32,
                                onSaved: (String value) {
                                  firstName = value.trim();
                                },
                                validator: validator.nameValidator,
                              ),
                            ),
                            //last name form fiels
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Enter your Last name',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  labelText: 'Last name',
                                ),
                                maxLength: 32,
                                onSaved: (String value) {
                                  lastName = value.trim();
                                },
                                validator: validator.nameValidator,
                              ),
                            ),
                            //Email form fiels
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
                                validator: validator.passwordvalidator,
                              ),
                            ),
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
                                  hintText: 'Confirm your password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  labelText: 'Confirm Password',
                                ),
                                obscureText: isHided,
                                maxLength: 32,
                                //Todo regarder pourquoi la validation pwd2 ne fonctione pas
                                onSaved: (String value) {
                                  password2 = value.trim();
                                  print('$password2 , $value ');
                                },
                                validator: (value) {
                                  // if (value.isEmpty) {
                                  //   return "Confirm your password";
                                  // } else
                                  print(password);
                                  if (value != password) {
                                    return "Password doesn't match";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      //button for validating the input
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Hero(
                        
                          tag: 'heroOne',
                          child: RoundedGradientButton(
                            label: 'Register now!',
                            onPressed: () {
                              print(
                                  '$firstName $lastName $email $password $password2');
                              print('');
                              if (_formKey.currentState.validate()) {
                                //_formKey.currentState.save();
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            },
                          ),
                        ),
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
