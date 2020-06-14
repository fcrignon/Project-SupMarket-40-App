import 'package:flutter/material.dart';
import 'package:market40Master/services/network/api_market_40.dart';
import 'package:market40Master/utils/style/constants.dart';
import 'package:market40Master/widgets/custom_alert_dialogue.dart';
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
  String _firstName;
  String _lastName;
  String _email;
  String _password;

  Market40Api api = Market40Api();
  Validator validator = Validator();

 
  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            CustomAlertDialogue(label: title , content: text ,)
      );

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
                    height: 150,
                    child: Image.asset('assets/images/Market40LogoExtended.png'),
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
                          'Register',
                          style: kTitleSignInUpStyle
                        ),
                      ),
                      Form(
                        autovalidate: true,
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
                                  labelStyle: kTextformFieldTextStyle,
                                  labelText: 'First name',
                                ),
                                maxLength: 32,
                                onSaved: (String value) =>
                                    setState(() => _firstName = value.trim()),
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
                                  labelStyle: kTextformFieldTextStyle,
                                  labelText: 'Last name',
                                ),
                                maxLength: 32,
                                onSaved: (String value) =>
                                    setState(() => _lastName = value.trim()),
                                validator: validator.nameValidator,
                              ),
                            ),
                            //_Email form fiels
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
                            //_Password form field
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

                      //button for validating the input
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RoundedGradientButton(
                          label: 'Register now!',
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate() == true) {
                              var res = await api.registerUser(
                                  _firstName, _password, _email, _lastName);
                              if (res == 201) {
                                displayDialog(context, "Success",
                                    "The user was created. Log in now.");
                                Navigator.popAndPushNamed(context, '/');
                              } else if (res == 409)
                                displayDialog(
                                    context,
                                    "That username is already registered",
                                    "Please try to sign up using another username or log in if you already have an account.");
                              else {
                                displayDialog(context, "Error",
                                    "An unknown error occurred.");
                              }
                            } else {
                              displayDialog(
                                  context, 'Error', "the form is not valid");
                            }
                          },
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
