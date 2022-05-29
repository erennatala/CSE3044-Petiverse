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
      body: ListView(
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
    );
  }
}
