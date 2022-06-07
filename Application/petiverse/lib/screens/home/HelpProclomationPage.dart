import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/model/help_proclomation_model.dart';
import 'package:petiverse/screens/home/detail_pages/help_proclomation_detail.dart';

class HelpProclamationPage extends StatefulWidget {
  final List helpAds;

  const HelpProclamationPage({Key? key, required this.helpAds})
      : super(key: key);
  HelpProclamationPageState createState() => HelpProclamationPageState();
}

class HelpProclamationPageState extends State<HelpProclamationPage> {
  @override
  Widget build(BuildContext context) {
    List<HelpProclomationModel> allHelpProclomations = List.generate(
        widget.helpAds.length,
        (index) => HelpProclomationModel(
            widget.helpAds[index]['Title'],
            widget.helpAds[index]['Pet\'s Type'],
            widget.helpAds[index]['Owner'],
            widget.helpAds[index]['Communication Number'],
            widget.helpAds[index]['Detailed Description'],
            widget.helpAds[index]['Pet\'s Gender'],
            widget.helpAds[index]['Pet\'s Breed'],
            widget.helpAds[index]['Date'],
            widget.helpAds[index]['Location']));
    return Scaffold(
      body: Column(children: [
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
                      padding: EdgeInsets.fromLTRB(0, 4, 3, 1),
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
                    height: 100,
                    width: 200,
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
          child: ListView(
            padding: EdgeInsets.all(0),
            children: allHelpProclomations
                .map((HelpProclomationModel e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.petType),
                      leading: ClipRRect(
                        child: const Text("Image"),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HelpProclomationDetailPage(
                                selectedProclomation: e),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
        )
      ]),
    );
  }
}
