class ForumModel {
  final String title;
  final String petType;
  final String petAge;
  final String disease;
  final String ownerName;
  final String detailedDescription;
  final String petBreed;
  final String communicationNumber;
  final String date;
  final List<dynamic> comments;
  ForumModel(
      this.title,
      this.petType,
      this.petAge,
      this.disease,
      this.ownerName,
      this.detailedDescription,
      this.petBreed,
      this.communicationNumber,
      this.date,
      this.comments);
}
