import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/screens/account/sign_in_page.dart';
import 'package:petiverse/utilities/white_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WhiteAppbar(
        appbar: AppBar(),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.001,
                left: MediaQuery.of(context).size.width * 0.04),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Forgot Password',
                style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff2e2d4a),
                ),
              ),
            ),
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
                    text: 'Please enter your email address',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
              ),
            ],
          ),
          SizedBox(
            height: height * 0.1,
          ),
          Container(
            padding: EdgeInsets.only(
                top: height * 0.04, left: width * 0.03, right: width * 0.03),
            width: double.infinity,
            height: height * 0.115,
            child: ElevatedButton(
              onPressed: () async {
                // dissmiss the keyboard
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('email: ' + _email);
                  _sendPasswordResetEmail(_email);
                  // send user to the sign in page
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const SignInPage()));
                }
              },
              child: RichText(
                text: TextSpan(
                  text: 'Reset Password',
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xffff203468),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendPasswordResetEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Err while sending mail" + e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("There was an error.")));
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Password reset email has been sent.")),
    );
  }
}
