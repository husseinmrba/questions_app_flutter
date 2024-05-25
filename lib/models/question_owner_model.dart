class QuestionOwnerModel {
  final String fullName;
  final String? profileImage;

  QuestionOwnerModel({
    required this.fullName,
    this.profileImage,
  });

  factory QuestionOwnerModel.fromJson(Map jsonData) {
    return QuestionOwnerModel(
      fullName: jsonData['display_name'],
      profileImage: jsonData['profile_image'],
    );
  }
}
