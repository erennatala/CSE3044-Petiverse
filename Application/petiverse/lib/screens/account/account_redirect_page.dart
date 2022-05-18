import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/screens/account/account_create_page.dart';
import 'package:petiverse/screens/account/sign_in_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petiverse/services/back_end.dart';
import 'package:intl/intl.dart';

// AR = Account Redirect
class AccountRedirectPage extends StatelessWidget {
  const AccountRedirectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(top: 70),
                margin: EdgeInsets.symmetric(horizontal: height * 0.05),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Join our community right now",
                    style: GoogleFonts.roboto(
                      fontSize: 31 * height * 0.0013,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 118, 5, 101),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Container(
                    width: width * 0.8,
                    height: height * 0.32,
                    padding: EdgeInsets.all(height * 0.01),
                    child: Image(
                        image: AssetImage('assets/images/create-account.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                padding: EdgeInsets.only(top: height * 0.05),
                margin: EdgeInsets.symmetric(horizontal: height * 0.06),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "And keep in touch with other pet lowers",
                    style: GoogleFonts.roboto(
                      fontSize: 23 * height * 0.0013,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 118, 5, 101),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: height * 0.03),
                child: ElevatedButton(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Create an Account",
                        style: GoogleFonts.roboto(
                          fontSize: 23 * height * 0.0013,
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AccountCreatePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 118, 5, 101),
                    minimumSize: Size(width * 0.9, 58 * height * 0.0013),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Already have an account?",
                      style: GoogleFonts.roboto(
                        fontSize: 16 * height * 0.0013,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 118, 5, 101),
                      ),
                    ),
                  )),
                  Container(
                      child: TextButton(
                    //We can change this to gesture detector.
                    onPressed: () async {
                      for (int i = 0; i < 50; i++) {
                        await BackEndServices().addTestDatasToFirebase(
                            "+905555555555",
                            formattedDate,
                            "This is " + i.toString() + ". mock ad for testing",
                            "All healty",
                            "Test Age",
                            "Test Type",
                            "Test Breed",
                            "Test Gender",
                            "This is " +
                                i.toString() +
                                ". mock title for testing",
                            "Test user");
                      }
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SignInPage()));
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Sign In",
                        style: GoogleFonts.roboto(
                            fontSize: 16 * height * 0.0013,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  )),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
