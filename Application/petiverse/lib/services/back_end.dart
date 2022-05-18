import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackEndServices {
  FirebaseFirestore _instance = FirebaseFirestore.instance;

  //SAVE USER TO FIREBASE
  Future<void> addUserDocumentToFireStore(
      String name, String email, String gender, String DOB) async {
    Map<String, dynamic> userInfoJSON = Map();
    userInfoJSON['Name'] = name;
    userInfoJSON['E-mail'] = email;
    userInfoJSON['Gender'] = gender;
    userInfoJSON['Birth Date'] = DOB;
    _instance
        .collection("users")
        .doc(email)
        .set(userInfoJSON)
        .then((v) => print("User data is added to firestore"));
  }

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

  //POST MOCK DATAS FOR TEST TO FIREBASE
  Future<void> addTestDatasToFirebase(
      String communicationNumber,
      String date,
      String detailedDescription,
      String disease,
      String petsAge,
      String petsType,
      String petsBreed,
      String petsGender,
      String title,
      String owner) async {
    Map<String, dynamic> userInfoJSON = Map();
    userInfoJSON['Title'] = title;
    userInfoJSON['Pet\'s Type'] = petsType;
    userInfoJSON['Pet\'s Age'] = petsAge;
    userInfoJSON['Owner'] = owner;
    userInfoJSON['Communication Number'] = communicationNumber;
    userInfoJSON['Disease'] = disease;
    userInfoJSON['Detailed Description'] = detailedDescription;
    userInfoJSON['Pet\'s Gender'] = petsGender;
    userInfoJSON['Pet\'s Breed'] = petsBreed;
    userInfoJSON['Date'] = date;
    _instance.collection("Forum Questions").add(userInfoJSON);
  }
}
