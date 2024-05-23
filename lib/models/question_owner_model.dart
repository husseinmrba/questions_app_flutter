class QuestionOwnerModel {
  final String fullName;
  final String profileImage;

  QuestionOwnerModel({
    required this.fullName,
    required this.profileImage,
  });

  factory QuestionOwnerModel.fromJson(Map jsonData) {
    return QuestionOwnerModel(
      fullName: jsonData['owner']['display_name'],
      profileImage: jsonData['owner']['profile_image'],
    );
  }
}
