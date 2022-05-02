import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/model/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivateAccountPage extends StatefulWidget {
  const ActivateAccountPage({Key? key}) : super(key: key);

  @override
  _ActivateAccountPageState createState() => _ActivateAccountPageState();
}

class _ActivateAccountPageState extends State<ActivateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          FontAwesome.angle_left,
          size: 50,
          color: Color(0xFFec5444),
        ),
        titleSpacing: 0,
        elevation: 0,
        leadingWidth: 30,
        title: Container(
          padding: EdgeInsets.only(top: 3),
          child: RichText(
              text: TextSpan(
                  text: 'Back',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Color(0xFFec5444),
                    fontWeight: FontWeight.w400,
                  ))),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Account Activation',
                  style: GoogleFonts.roboto(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2e2d4a),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'Before you can login, you must activate your account with the code sent to your email address.',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2e2d4a),
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 0.2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 0.2)),
                      hintText: 'Enter your activation code',
                    ))),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff28346c),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.96, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Activate Account',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Already activated?",
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
                Container(
                    child: TextButton(
                  onPressed: () {},
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Sign In",
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
      ),
    );
  }
}
