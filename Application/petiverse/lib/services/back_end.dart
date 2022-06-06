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

  //POST SERVICE FOR ADOPTION ADS
  Future<void> addAdoptionAdToFireStore(
      String _title,
      String _detailedDescription,
      String _petsAge,
      String _petsType,
      String _petsBreed,
      String _diseaseInfo,
      String _ownerName,
      String _petsGender,
      String _communicationNumber,
      String shareDate) async {
    Map<String, dynamic> ad = Map();
    ad['Title'] = _title;
    ad['Pet\'s Type'] = _petsType;
    ad['Pet\'s Age'] = _petsAge;
    ad['Owner'] = _ownerName;
    ad['Communication Number'] = _communicationNumber;
    ad['Disease'] = _diseaseInfo;
    ad['Detailed Description'] = _detailedDescription;
    ad['Pet\'s Gender'] = _petsGender;
    ad['Pet\'s Breed'] = _petsBreed;
    ad['Date'] = shareDate;
    _instance.collection("Adoption Ads").add(ad);
  }

  //POST SERVICE FOR MATING ADS
  Future<void> addMatingAdToFireStore(
      String _title,
      String _detailedDescription,
      String _petsAge,
      String _petsType,
      String _petsBreed,
      String _diseaseInfo,
      String _ownerName,
      String _petsGender,
      String _communicationNumber,
      String shareDate) async {
    Map<String, dynamic> ad = Map();
    ad['Title'] = _title;
    ad['Pet\'s Type'] = _petsType;
    ad['Pet\'s Age'] = _petsAge;
    ad['Owner'] = _ownerName;
    ad['Communication Number'] = _communicationNumber;
    ad['Disease'] = _diseaseInfo;
    ad['Detailed Description'] = _detailedDescription;
    ad['Pet\'s Gender'] = _petsGender;
    ad['Pet\'s Breed'] = _petsBreed;
    ad['Date'] = shareDate;
    _instance.collection("Mating Ads").add(ad);
  }

  //POST SERVICE FOR HELP ADS
  Future<void> addHelpAdToFireStore(
      String _title,
      String _petsType,
      String _ownerName,
      String _communicationNumber,
      String _detailedDescription,
      String _petsGender,
      String _petsBreed,
      String shareDate,
      String location) async {
    Map<String, dynamic> ad = Map();
    ad['Title'] = _title;
    ad['Pet\'s Type'] = _petsType;
    ad['Owner'] = _ownerName;
    ad['Communication Number'] = _communicationNumber;
    ad['Detailed Description'] = _detailedDescription;
    ad['Pet\'s Gender'] = _petsGender;
    ad['Pet\'s Breed'] = _petsBreed;
    ad['Date'] = shareDate;
    ad['Location'] = location;
    _instance.collection("Mating Ads").add(ad);
  }

  //POST SERVICE FOR FORUM TOPICS
  Future<void> addForumTopicToFireStore(
      String _title,
      String _petsType,
      String _petsAge,
      String _diseaseInfo,
      String _ownerName,
      String _detailedDescription,
      String _petsBreed,
      String _communicationNumber,
      String _petsGender,
      String shareDate,
      List comments) async {
    Map<String, dynamic> ad = Map();
    ad['Title'] = _title;
    ad['Pet\'s Type'] = _petsType;
    ad['Pet\'s Age'] = _petsAge;
    ad['Owner'] = _ownerName;
    ad['Communication Number'] = _communicationNumber;
    ad['Disease'] = _diseaseInfo;
    ad['Detailed Description'] = _detailedDescription;
    ad['Pet\'s Gender'] = _petsGender;
    ad['Pet\'s Breed'] = _petsBreed;
    ad['Date'] = shareDate;
    ad['Comments'] = comments;
    _instance.collection("Forum Questions").add(ad);
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
