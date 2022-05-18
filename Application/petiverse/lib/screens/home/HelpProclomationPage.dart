import 'package:flutter/material.dart';
import 'package:petiverse/model/help_proclomation_model.dart';

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
            widget.helpAds[index]['Name'],
            widget.helpAds[index]['Location']));
    return Scaffold(
      body: ListView(
        children: allHelpProclomations
            .map((HelpProclomationModel e) => ListTile(
                  title: Text(e.title),
                  subtitle: Text(e.petType),
                  leading: ClipRRect(
                    child: const Text("Image"),
                  ),
                  trailing: Text("sasa"),
                ))
            .toList(),
      ),
    );
  }
}
