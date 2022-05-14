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
}
