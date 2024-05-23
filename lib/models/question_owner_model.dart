class QuestionOwnerModel {
  final String fullName;
  final String profileImage;

  QuestionOwnerModel({
    required this.fullName,
    required this.profileImage,
  });

  factory QuestionOwnerModel.fromJson(Map jsonData) {
    return QuestionOwnerModel(
      fullName: jsonData['display_name'],
      profileImage: jsonData['profile_image'] ??
          'https://www.kindpng.com/picc/m/33-338711_circle-user-icon-blue-hd-png-download.png',
    );
  }
}
