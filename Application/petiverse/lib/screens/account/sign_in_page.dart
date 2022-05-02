import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/screens/account/account_create_page.dart';
import 'package:petiverse/screens/account/forgot_password_page.dart';
import 'package:petiverse/screens/home/main_page.dart';
import 'package:petiverse/services/back_end.dart';
import 'package:petiverse/utilities/white_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petiverse/utilities/white_appbar.dart';
import 'package:provider/provider.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
// does sign in phase failed ? (same error messages for both wrong email and password for security issues)
bool _isSignInFailed = false;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';
  bool _isHidden = true;
  Icon _hideIcon = Icon(
    Entypo.eye,
    color: Colors.black,
    size: 18,
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: WhiteAppbar(
          appbar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        left: MediaQuery.of(context).size.width * 0.04),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Sign in Your Account',
                        style: GoogleFonts.roboto(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2e2d4a),
                        ),
                      ),
                    ),
                  ),
                  Form(
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
                                  text: 'E-mail Address',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
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
                                    borderSide: BorderSide(width: 0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Enter your email',
                                ),
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
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
                                    borderSide: BorderSide(width: 0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 0.2),
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
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.015),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 118, 5, 101),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * 0.96, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        // close the keyboard first in order to prevent overflow with the next page
                        FocusScope.of(context).unfocus();
                        // Sing in mechanism
                        bool _validate = _formKey.currentState!.validate();

                        // if all inputs are valid then save the data
                        if (_validate) {
                          _formKey.currentState!.save();
                          print("inputs are valid");
                          print("Siging in now ...");
                          await signingWithEmailAndPassword(_email, _password);
                        }
                        if (_isSignInFailed) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login Failed")));
                        } else {
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => MainPage(),
                            ),
                          );
                        }
                      },
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Sign In',
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.025,
                        right: MediaQuery.of(context).size.width * 0.04),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => ForgotPasswordPage()));
                      },
                      child: RichText(
                        textAlign: TextAlign.right,
                        text: TextSpan(
                          text: 'Forgot password?',
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff2e2d4a),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.1),
                      ),
                      Container(
                          child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Donʼt have an account?",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                      Container(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => AccountCreatePage(),
                            ),
                          );
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: " Sign Up",
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue),
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> signingWithEmailAndPassword(
      String email, String password) async {
    try {
      // check if there is no user signed in
      if (_auth.currentUser == null) {
        User? signedInUser = (await _auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
        // check if signed in user is email verified if not then sign them out
        if (!signedInUser!.emailVerified) {
          print("user is not email verified");
          _isSignInFailed = true;
          _auth.signOut();
        }
        print("user has signed in with email : ${signedInUser.email} ");
      } else {
        // if user is already signed in then sign them out
        _auth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      _isSignInFailed = true;

      print("**********SIGN IN ERROR***************");
      if (e.code == 'user-not-found') {
        print("User not found");

        _isSignInFailed = true;

        _auth.signOut();
      } else if (e.code == 'wrong-password') {
        print("Wrong password");

        _isSignInFailed = true;

        _auth.signOut();
      } else {
        print(e);
      }
    }
  }
}

// TODO: password visibility is not working
// TODO: Handle pageroutes according to exceptions
// TODO: Keyboard causes overflow on page change
