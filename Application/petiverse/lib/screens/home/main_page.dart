import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:petiverse/screens/home/AdoptionProclomationPage.dart';
import 'package:petiverse/screens/home/ForumPage.dart';
import 'package:petiverse/screens/home/HelpProclomationPage.dart';
import 'package:petiverse/screens/home/MatingProclomationPage.dart';
import 'package:petiverse/screens/home/SharingPage.dart';
import 'package:petiverse/utilities/navigation_drawer.dart';
import 'package:petiverse/services/back_end.dart';
import 'package:petiverse/utilities/white_appbar.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;

class MainPage extends StatefulWidget {
  MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List adoptionAds = [], matingAds = [], helpAds = [], forumQuestions = [];

  PageController pageController = PageController();
  List<Color> colors = [
    const Color(0xFFEB5644),
    const Color(0xff28346c),
    const Color(0xFF37bff0),
    const Color(0xFFc4cc22),
    Color.fromARGB(255, 69, 3, 74),
  ];
  Color _backgroundColor = const Color(0xff28346c);

  fetchFileData() async {
    adoptionAds = await BackEndServices().getAdoptionAdsFromFirebase();
    matingAds = await BackEndServices().getMatingAdsFromFirebase();
    helpAds = await BackEndServices().getHelpAdsFromFirebase();
    forumQuestions = await BackEndServices().getForumQuestionsFromFirebase();

    List<Widget> screens = [
      AdoptionProclamationPage(
        adoptionAds: adoptionAds,
      ),
      MatingProclamationPage(
        matingAds: matingAds,
      ),
      SharingPage(),
      HelpProclamationPage(
        helpAds: helpAds,
      ),
      ForumPage(
        forumQuestions: forumQuestions,
      )
    ];
    return screens;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occured',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            final data = snapshot.data as List<Widget>;
            return Scaffold(
              drawer: NavigationDrawer(),
              backgroundColor: Colors.white,
              body: data[_selectedIndex],
              bottomNavigationBar: buildBottomBar(),
            );
          }
        }
        return Scaffold(
          drawer: NavigationDrawer(),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.02,
                    right: MediaQuery.of(context).size.width * 0.02,
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 1, 3, 1),
                            child: GestureDetector(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(
                                Icons.list,
                                size: 40,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/petiverse-logo.png',
                          height: 40,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.blue.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: buildBottomBar(),
        );
        // Displaying LoadingSpinner to indicate waiting state
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: fetchFileData(),
    );
  }

  Widget buildBottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: _backgroundColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      iconSize: 30,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _backgroundColor = colors[index];
        });
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ios_home),
          label: 'Adopt',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ios_paw),
          label: 'Mate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ios_add_circle_outline),
          label: 'Share',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ios_alert),
          label: 'Animals In Need',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.ios_people),
          label: 'Forum',
        ),
      ],
    );
  }
}
