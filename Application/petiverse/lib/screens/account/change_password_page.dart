import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/utilities/white_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool _isHidden = true;
  bool _isNewHidden = true;
  Icon _hideIcon = Icon(
    Entypo.eye,
    color: Colors.black,
    size: 18,
  );
  Icon _hideNewIcon = Icon(
    Entypo.eye,
    color: Colors.black,
    size: 18,
  );
  String _oldPassword = '';
  String _newPassword = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WhiteAppbar(appbar: AppBar()),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.01,
                left: MediaQuery.of(context).size.width * 0.04),
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Change Password',
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
                    text: 'Current Password',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
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
                    _oldPassword = value!;
                    print('password: ' + _oldPassword);
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
                    hintText: 'Enter your current password.',
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
                    text: 'New Password',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: TextFormField(
                  obscureText: _isNewHidden,
                  validator: (pass) {
                    // TODO: implement a complex password validation mechanism
                    if (pass!.length < 6) {
                      return 'Password must be at least 6 characters long.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _newPassword = value!;
                    print('password: ' + _newPassword);
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
                          _isNewHidden = !_isNewHidden;
                          _hideNewIcon = _isNewHidden
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
                      icon: _hideNewIcon,
                      splashRadius: 10,
                    ),
                    hintText: 'Enter your new password.',
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                top: height * 0.04, left: width * 0.03, right: width * 0.03),
            width: double.infinity,
            height: height * 0.115,
            child: ElevatedButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  text: 'Change Save',
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
}
