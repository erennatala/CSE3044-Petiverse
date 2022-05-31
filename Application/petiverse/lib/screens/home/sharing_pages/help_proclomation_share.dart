import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/model/user_model.dart';
import 'package:petiverse/screens/account/sign_in_page.dart';
import 'package:petiverse/screens/other/terms_and_conditions.dart';
import 'package:petiverse/services/back_end.dart';
import 'package:petiverse/utilities/white_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// global user for this instance
FirebaseFirestore _firestore = FirebaseFirestore.instance;

class HelpProclomationShare extends StatefulWidget {
  const HelpProclomationShare({Key? key}) : super(key: key);

  @override
  _HelpProclomationShareState createState() => _HelpProclomationShareState();
}

class _HelpProclomationShareState extends State<HelpProclomationShare> {
  bool _permissionIsTrue = false;
  bool _agreementsIsTrue = false;
  bool _isHidden = true;

  Icon _hideIcon = Icon(
    Entypo.eye,
    color: Colors.black,
    size: 18,
  );
  final _formKey = GlobalKey<FormState>();
// user provided info for account creating page
  String _name = '';
  String _email = '';
  String _password = '';
  late UserModel user;
  String DOB = '19700101';
  String _gender = '';
  int val = -1;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    user = UserModel(
      email: _email,
      password: _password,
      name: _name,
      dateOfBirth: DOB,
      permissionsChecked: _permissionIsTrue,
      agreementsChecked: _agreementsIsTrue,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WhiteAppbar(
        appbar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: height * 0.02),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: width * 0.04, top: height * 0.01),
                child: RichText(
                    text: TextSpan(
                  text: 'Create an Account',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      fontSize: 32 * height * 0.0013,
                      color: Color(0xFF2C2E4A)),
                )),
              ),
              // WRAPPED THE INPUT FIELDS WITH FORM WIDGET SO WE CAN USE VALIDATION AND OTHER INPUT RELATED FUNCTIONS
              Form(
                // validate input when user taps on next or submit button
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            bottom: height * 0.01,
                            left: width * 0.03,
                            right: width * 0.03,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Name',
                              style: GoogleFonts.roboto(
                                fontSize: 16 * height * 0.0013,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.065,
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.002),
                          child: TextFormField(
                            validator: (_name) {
                              if (_name!.length < 2) {
                                return "Your name should be consist of at least 2 character";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              _name = value!;
                              print('name: ' + _name);
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter your name',
                                hintStyle:
                                    TextStyle(fontSize: 16 * height * 0.0013)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            bottom: height * 0.01,
                            left: width * 0.03,
                            right: width * 0.03,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'E-mail Address',
                              style: GoogleFonts.roboto(
                                fontSize: 16 * height * 0.0013,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.065,
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: TextFormField(
                            validator: (email) {
                              if (!EmailValidator.validate(email!)) {
                                return 'Please enter a valid email.';
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _email = value!;
                              print('email: ' + _email);
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.8),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                hintText: 'Enter your email',
                                hintStyle:
                                    TextStyle(fontSize: 16 * height * 0.0013)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(
                            top: height * 0.02,
                            bottom: height * 0.01,
                            left: width * 0.03,
                            right: width * 0.03,
                          ),
                          child: RichText(
                            text: TextSpan(
                              text: 'Password',
                              style: GoogleFonts.roboto(
                                fontSize: 16 * height * 0.0013,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: height * 0.065,
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: TextFormField(
                            obscureText: _isHidden,
                            validator: (pass) {
                              // TODO: implement a complex password validation mechanism
                              if (pass!.length < 6) {
                                return 'Password must be at least 6 characters long.';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              _password = value!;
                              print('password: ' + _password);
                            },
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isHidden = !_isHidden;
                                    _hideIcon = _isHidden
                                        ? Icon(
                                            Entypo.eye,
                                            color: Colors.black,
                                            size: 18,
                                          )
                                        : Icon(
                                            Entypo.eye_with_line,
                                            color: Colors.black,
                                            size: 18,
                                          );
                                  });
                                },
                                icon: _hideIcon,
                                splashRadius: 10,
                              ),
                              hintText: 'Enter your password.',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.04, top: height * 0.02),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Birth Date',
                        style: TextStyle(
                          fontSize: 16 * height * 0.0013,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 75,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(1969, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {
                          DOB = "$newDateTime";
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: width * 0.04, top: height * 0.02),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Gender',
                        style: TextStyle(
                          fontSize: 18 * height * 0.0013,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  // bad way to close the keyboard
                                  FocusScope.of(context).unfocus();
                                  val = value as int;
                                  _gender = "Male";
                                });
                              },
                              activeColor: Color(0xffff203468),
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 16 * height * 0.0013,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: val,
                              onChanged: (value) {
                                // bad way to close the keyboard
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  val = value as int;
                                  _gender = "Female";
                                });
                              },
                              activeColor: Color.fromARGB(255, 118, 5, 101),
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 16 * height * 0.0013,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    permissionSwitchButton(width, height),
                    agreementSwitchButton(width, height),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: height * 0.04,
                    left: width * 0.03,
                    right: width * 0.03),
                width: double.infinity,
                height: height * 0.1,
                child: ElevatedButton(
                  onPressed: () {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                      // check if user has agreed on policy and gave the permission
                      if (_agreementsIsTrue && _permissionIsTrue) {
                        // if so then create the user

                      }
                      // TO DO : DONT LET THE USER TO SIGN UP IF HE/SHE IS YOUNGER THAN 18
                      BackEndServices().addUserDocumentToFireStore(
                          _name, _email, _gender, DOB);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text(
                            'Your account has been created, check your mail box for confirmation e-mail.'),
                        backgroundColor: Colors.green,
                      ));

                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const SignInPage()));
                    }
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Get Started',
                      style: GoogleFonts.roboto(
                        fontSize: 24 * height * 0.0013,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 118, 5, 101),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column permissionSwitchButton(double width, double height) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: width * 0.04, top: height * 0.01),
          child: RichText(
              text: TextSpan(
            text: 'Permissions',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 18 * height * 0.0013,
                color: Color(0xFF2C2E4A)),
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.01),
          child: Row(
            children: [
              CupertinoSwitch(
                  value: _permissionIsTrue,
                  onChanged: (value) {
                    setState(() {
                      _permissionIsTrue = !_permissionIsTrue;
                    });
                  }),
              Container(
                padding: EdgeInsets.only(left: width * 0.03),
                width: width * 0.75,
                child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                        text:
                            "Iʼd like to receive Petiverse newsletters and stay up-to-date.",
                        style: GoogleFonts.roboto(color: Colors.black))),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column agreementSwitchButton(double width, double height) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: width * 0.04, top: height * 0.03),
          child: RichText(
              text: TextSpan(
            text: 'Agreements',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 18 * height * 0.0013,
                color: Color(0xFF2C2E4A)),
          )),
        ),
        Container(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.01),
          child: Row(
            children: [
              CupertinoSwitch(
                  value: _agreementsIsTrue,
                  onChanged: (value) {
                    setState(() {
                      _agreementsIsTrue = !_agreementsIsTrue;
                    });
                  }),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Wrap(
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'I agree to the ',
                            style: GoogleFonts.roboto(color: Colors.black)),
                        TextSpan(
                            text: 'terms and conditions and privacy policy.',
                            style: GoogleFonts.roboto(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('object');
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        TermsAndConditionsPage(),
                                  ),
                                );
                              }),
                      ]))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
