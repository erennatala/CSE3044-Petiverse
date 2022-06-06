import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/model/mating_proclomation_model.dart';
import 'package:petiverse/screens/home/detail_pages/mating_proclomation_detail.dart';

class MatingProclamationPage extends StatefulWidget {
  final List matingAds;

  const MatingProclamationPage({Key? key, required this.matingAds})
      : super(key: key);
  @override
  MatingProclamationPageState createState() => MatingProclamationPageState();
}

class MatingProclamationPageState extends State<MatingProclamationPage> {
  @override
  Widget build(BuildContext context) {
    List<MatingProclomationModel> allMatingProclomations = List.generate(
        widget.matingAds.length,
        (index) => MatingProclomationModel(
            widget.matingAds[index]['Title'],
            widget.matingAds[index]['Pet\'s Type'],
            widget.matingAds[index]['Pet\'s Age'],
            widget.matingAds[index]['Owner'],
            widget.matingAds[index]['Communication Number'],
            widget.matingAds[index]['Disease'],
            widget.matingAds[index]['Detailed Description'],
            widget.matingAds[index]['Pet\'s Gender'],
            widget.matingAds[index]['Pet\'s Breed'],
            widget.matingAds[index]['Date']));
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
          child: ListView(
            padding: EdgeInsets.all(0),
            children: allMatingProclomations
                .map((MatingProclomationModel e) => ListTile(
                      title: Text(e.title),
                      subtitle: Text(e.petType),
                      leading: ClipRRect(
                        child: const Text("Image"),
                      ),
                      trailing: Text("sasa"),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => MatingProclomationDetailPage(
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
