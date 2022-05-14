import 'package:flutter/material.dart';
import 'package:petiverse/model/adoption_proclomation_model.dart';

class AdoptionProclamationPage extends StatefulWidget {
  final List adoptionAds;

  const AdoptionProclamationPage({Key? key, required this.adoptionAds})
      : super(key: key);

  @override
  AdoptionProclamationPageState createState() =>
      AdoptionProclamationPageState();
}

class AdoptionProclamationPageState extends State<AdoptionProclamationPage> {
  @override
  Widget build(BuildContext context) {
    List<AdoptionProclomationModel> allAdoptionProclomations = List.generate(
        widget.adoptionAds.length,
        (index) => AdoptionProclomationModel(
            widget.adoptionAds[index]['Title'],
            widget.adoptionAds[index]['Pet\'s Type'],
            widget.adoptionAds[index]['Pet\'s Age'],
            widget.adoptionAds[index]['Owner'],
            widget.adoptionAds[index]['Communication Number'],
            widget.adoptionAds[index]['Disease'],
            widget.adoptionAds[index]['Detailed Description'],
            widget.adoptionAds[index]['Pet\'s Gender'],
            widget.adoptionAds[index]['Pet\'s Breed'],
            widget.adoptionAds[index]['Date']));
    return Scaffold(
      body: ListView(
        children: allAdoptionProclomations
            .map((AdoptionProclomationModel e) => ListTile(
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
