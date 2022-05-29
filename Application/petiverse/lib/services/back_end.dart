import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BackEndServices {
  FirebaseFirestore _instance = FirebaseFirestore.instance;

  //SAVE USER TO FIREBASE
  Future<void> addUserDocumentToFireStore(
      String name, String email, String gender, String DOB) async {
    Map<String, dynamic> mockData = Map();
    mockData['Name'] = name;
    mockData['E-mail'] = email;
    mockData['Gender'] = gender;
    mockData['Birth Date'] = DOB;
    _instance
        .collection("users")
        .doc(email)
        .set(mockData)
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
      String owner,
      List comments) async {
    Map<String, dynamic> mockData = Map();
    mockData['Title'] = title;
    mockData['Pet\'s Type'] = petsType;
    mockData['Pet\'s Age'] = petsAge;
    mockData['Owner'] = owner;
    mockData['Communication Number'] = communicationNumber;
    mockData['Disease'] = disease;
    mockData['Detailed Description'] = detailedDescription;
    mockData['Pet\'s Gender'] = petsGender;
    mockData['Pet\'s Breed'] = petsBreed;
    mockData['Date'] = date;
    mockData['Comments'] = comments;
    _instance.collection("Forum Questions").add(mockData);
  }
}
