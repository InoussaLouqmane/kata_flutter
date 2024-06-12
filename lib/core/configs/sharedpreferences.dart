import "package:flutter/material.dart";
import "package:kata_mobile_frontui/modules/shared/models/UserModel.dart";
import "package:shared_preferences/shared_preferences.dart";

Future<String?> getToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('auth_token');
}

Future<void> removeToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('auth_token');
}

saveToken(String value) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.setString('auth_token', value);
}

saveUserModel(Map<String, dynamic> value){
  final user = UserModel();
  user.email = value['email'];
  user.firstName = value['firstName'];
  user.lastName = value['lastName'];
  user.password = value['password'];
  user.photoPath = value['photoPath'];
  user.phone = value['phone'];
  user.bioDescription = value[''];
  user.birthDate = value[''];
  user.currentDojo = value[''];
  user.email = value[''];
  user.email = value[''];
  user.email = value[''];
}