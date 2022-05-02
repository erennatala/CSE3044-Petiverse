class UserModel {
  // this data will also represents "user" collection in firestore
  String email;
  String password;
  String name;
  bool permissionsChecked;
  bool agreementsChecked;
  String dateOfBirth;
  UserModel(
      {this.email = '',
      this.password = '',
      this.name = '',
      this.permissionsChecked = false,
      this.agreementsChecked = false,
      this.dateOfBirth = ""});
}
