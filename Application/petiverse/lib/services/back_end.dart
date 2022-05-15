import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackEndServices {
  FirebaseFirestore _instance = FirebaseFirestore.instance;

  //GET SERVICE FOR ADOPTION ADS
  Future<List> getAdoptionAdsFromFirebase() async {
    CollectionReference col = _instance.collection('Adoption Ads');
    QuerySnapshot snapshot = await col.get();
    final allAdoptionAds = snapshot.docs.map((doc) => doc.data()).toList();
    return allAdoptionAds;
  }

  //GET SERVICE FOR MATING ADS
  Future<List> getMatingAdsFromFirebase() async {
    CollectionReference col = _instance.collection('Mating Ads');
    QuerySnapshot snapshot = await col.get();
    final allMatingAds = snapshot.docs.map((doc) => doc.data()).toList();
    return allMatingAds;
  }

  //GET SERVICE FOR HELP ADS
  Future<List> getHelpAdsFromFirebase() async {
    CollectionReference col = _instance.collection('Help Ads');
    QuerySnapshot snapshot = await col.get();
    final allHelpAds = snapshot.docs.map((doc) => doc.data()).toList();
    return allHelpAds;
  }

  //GET SERVICE FOR FORUM QUESTIONS
  Future<List> getForumQuestionsFromFirebase() async {
    CollectionReference col = _instance.collection('Forum Questions');
    QuerySnapshot snapshot = await col.get();
    final allForumQuestions = snapshot.docs.map((doc) => doc.data()).toList();
    return allForumQuestions;
  }
}
