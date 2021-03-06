import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/model/adoption_proclomation_model.dart';
import 'package:petiverse/model/help_proclomation_model.dart';
import 'package:petiverse/model/user_model.dart';
import 'package:petiverse/screens/account/sign_in_page.dart';
import 'package:petiverse/screens/home/main_page.dart';
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
  final _formKey = GlobalKey<FormState>();
// user provided info for account creating page
  String _title = '';
  String _detailedDescription = '';
  String _petsAge = '';
  String _petsType = '';
  String _petsBreed = '';
  String _diseaseInfo = '';
  String _ownerName = '';
  String _petsGender = '';
  String _communicationNumber = '';
  String location = '';
  String shareDate = DateTime.now().toString();
  late HelpProclomationModel ad;

  @override
  void initState() {
    super.initState();
    ad = HelpProclomationModel(
        _title,
        _petsType,
        _ownerName,
        _communicationNumber,
        _detailedDescription,
        _petsGender,
        _petsBreed,
        shareDate.toString(),
        location);
  }

  int val = -1;

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
                  text: 'Share A Help Ad',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w900,
                      fontSize: 32 * height * 0.0013,
                      color: Color(0xFF2C2E4A)),
                )),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: height * 0.04,
                    left: width * 0.03,
                    right: width * 0.03),
                width: double.infinity,
                height: height * 0.1,
                child: ElevatedButton(
                  onPressed: () async {
                    final selectedImage = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['png', 'jpg']);
                    if (selectedImage == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Please choose a png of jpg to upload")));
                    }
                    final path = selectedImage?.files.single.path;
                    final fileName = _title;
                    await BackEndServices().uploadImage(path!, fileName);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Upload Photo',
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
                              text: 'Title',
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
                            validator: (_title) {
                              if (_title!.length < 3) {
                                return "Title should be consist of at least 3 character";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              _title = value!;
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
                                hintText: 'Enter a title',
                                hintStyle:
                                    TextStyle(fontSize: 16 * height * 0.0013)),
                          ),
                        ),
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
                              text: 'Detailed Description',
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
                            onSaved: (value) {
                              _detailedDescription = value!;
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
                                hintText: 'Enter description',
                                hintStyle:
                                    TextStyle(fontSize: 16 * height * 0.0013)),
                          ),
                        ),
                      ],
                    ),
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
                          text: 'Location',
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
                          horizontal: width * 0.03, vertical: height * 0.002),
                      child: TextFormField(
                        onSaved: (value) {
                          location = value!;
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
                            hintText: 'Enter the location info',
                            hintStyle:
                                TextStyle(fontSize: 16 * height * 0.0013)),
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
                              text: 'Pet\'s Type',
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
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _petsType = value!;
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
                                hintText: 'Write the pet type',
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
                              text: 'Pet\'s Breed',
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
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _petsBreed = value!;
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
                                hintText: 'Write the pet breed',
                                hintStyle:
                                    TextStyle(fontSize: 16 * height * 0.0013)),
                          ),
                        ),
                      ],
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
                                  _petsGender = "Male";
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
                                  _petsGender = "Female";
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
                          text: 'Your Name',
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
                          horizontal: width * 0.03, vertical: height * 0.002),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          _ownerName = value!;
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
                          text: 'Phone Number',
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
                          horizontal: width * 0.03, vertical: height * 0.002),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) {
                          _communicationNumber = value!;
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
                            hintText: 'Enter your communication number',
                            hintStyle:
                                TextStyle(fontSize: 16 * height * 0.0013)),
                      ),
                    ),
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
                  onPressed: () async {
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) _formKey.currentState!.save();
                    await BackEndServices().addHelpAdToFireStore(
                      _title,
                      _petsType,
                      _ownerName,
                      _communicationNumber,
                      _detailedDescription,
                      _petsGender,
                      _petsBreed,
                      shareDate,
                      location,
                    );
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => MainPage()));
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Share',
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
}
