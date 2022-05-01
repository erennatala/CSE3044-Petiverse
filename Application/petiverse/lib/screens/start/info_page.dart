import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:petiverse/screens/account/account_redirect_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          width: width * 0.4,
          child: Image.asset('assets/images/petiverse-logo.png'),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                GeneralInfoPage(
                  'assets/images/adopt.png',
                  'Adopt',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  Color(0xFFEB5644),
                  height,
                  width,
                ),
                GeneralInfoPage(
                  'assets/images/find-friend.png',
                  'Find Friends For Your Pet',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  Color(0xFF37bff0),
                  height,
                  width,
                ),
                GeneralInfoPage(
                  'assets/images/help-ad.png',
                  'Help the animals in need',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  Color(0xFFc4cc22),
                  height,
                  width,
                ),
              ],
            ),
          ),
          GenerateDotIndicator(),
          LetsBeginButton(height),
        ],
      ),
    );
  }

  Container GenerateDotIndicator() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: SmoothPageIndicator(
        controller: _pageController,
        count: 3,
      ),
    );
  }

  Container LetsBeginButton(
    double height,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        onPressed: () {
          //  Navigator.pushReplacement(
          //    context, CupertinoPageRoute(builder: (context) => ARPage()));
        },
        child: Text(
          "Let's Begin",
          style: TextStyle(fontSize: 19 * height * 0.0013),
        ),
        style: ElevatedButton.styleFrom(
          primary: Color.fromARGB(255, 112, 4, 151),
          minimumSize: Size(
              MediaQuery.of(context).size.width * 0.9, 50 * height * 0.0013),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget GeneralInfoPage(
    String imgRoute,
    String title,
    String descr,
    Color color,
    double height,
    double width,
  ) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              width: width,
              height: height * 0.49,
              child: Image.asset(
                imgRoute,
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22 * height * 0.0013,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            thickness: 0,
            height: 20,
            color: color,
            endIndent: 175,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Text(
              descr,
              style: TextStyle(
                fontSize: 20 * height * 0.0013,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
