import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/screens/home/sharing_pages/adoption_proclomation_share.dart';
import 'package:petiverse/screens/home/sharing_pages/forum_question_share.dart';
import 'package:petiverse/screens/home/sharing_pages/help_proclomation_share.dart';
import 'package:petiverse/screens/home/sharing_pages/mating_proclomation_share.dart';

class SharingPage extends StatefulWidget {
  @override
  SharingPageState createState() => SharingPageState();
}

class SharingPageState extends State<SharingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: width * 0.95,
          padding: EdgeInsets.only(
            top: height * 0.17,
            bottom: height * 0.05,
            left: width * 0.05,
          ),
          child: ElevatedButton(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Adoption",
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => AdoptionProclomationShare()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF37bff0),
              minimumSize: Size(width * 0.9, 58 * height * 0.0013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          width: width * 0.95,
          padding: EdgeInsets.only(
            top: height * 0.04,
            bottom: height * 0.04,
            left: width * 0.05,
          ),
          child: ElevatedButton(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Mating",
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => MatingProclomationShare()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF37bff0),
              minimumSize: Size(width * 0.9, 58 * height * 0.0013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          width: width * 0.95,
          padding: EdgeInsets.only(
            top: height * 0.04,
            bottom: height * 0.04,
            left: width * 0.05,
          ),
          child: ElevatedButton(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Help",
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => HelpProclomationShare()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF37bff0),
              minimumSize: Size(width * 0.9, 58 * height * 0.0013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Container(
          width: width * 0.95,
          padding: EdgeInsets.only(
            top: height * 0.04,
            bottom: height * 0.04,
            left: width * 0.05,
          ),
          child: ElevatedButton(
            child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Forum Topic",
                )),
            onPressed: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ForumQuestionShare()));
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF37bff0),
              minimumSize: Size(width * 0.9, 58 * height * 0.0013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
