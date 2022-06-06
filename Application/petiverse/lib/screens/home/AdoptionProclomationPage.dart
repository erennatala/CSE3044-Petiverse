import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petiverse/model/adoption_proclomation_model.dart';
import 'package:petiverse/screens/home/detail_pages/adoption_proclomation_detail.dart';

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
            children: allAdoptionProclomations
                .map((AdoptionProclomationModel e) => ListTile(
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
                            builder: (context) =>
                                AdoptionProclomationDetailPage(
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
