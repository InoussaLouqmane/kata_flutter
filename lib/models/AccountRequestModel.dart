import 'dart:ffi';

class AccountRequestModel {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late int genre;
  late int martialArtType;
  late String? licenseId;
  late int grade;
  late String clubName;
  late String clubEmail;
  late String status;
  late String? comment;
  late int? userId;
  late String? clubAddress;
  late String role;

  AccountRequestModel();

  factory AccountRequestModel.fromJson(Map<String, dynamic> data) {
    return AccountRequestModel()
      ..id = data['id'] as int
      ..firstName = data['firstName'] as String
      ..lastName = data['lastName'] as String
      ..email = data['email'] as String
      ..phone = data['phone'] as String
      ..genre = data['genre'] as int
      ..martialArtType = data['martialArtType'] as int
      ..licenseId = data['licenseId'] as String ?? ''
      ..grade = data['grade'] as int
      ..clubName = data['clubName'] as String
      ..clubEmail = data['clubEmail'] as String
      ..status = data['status'] as String
      ..comment = data['comment'] as String ?? ''
      ..userId = data['userId'] as int ?? null
      ..clubAddress = data['clubAddress'] as String
      ..role = data['role'] as String;
  }
}
