import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:kata_mobile_frontui/models/UserModel.dart";
import "package:shared_preferences/shared_preferences.dart";

 class SessionService{
    static const Storage  = FlutterSecureStorage();

    Future<UserModel?> getCurrentUser() async {
      try {
        String? userJson = await Storage.read(key: 'auth_user');
        print('Raw userJson: $userJson'); // Log le contenu brut

        if (userJson == null) {
          print('auth_user key is null.');
          return null;
        }

        final userMap = jsonDecode(userJson);
        print('Parsed userMap: $userMap'); // Log le contenu du JSON parsé

        return UserModel.fromJson(userMap as Map<String, dynamic>);
      } catch (e) {
        print('Error in getCurrentUser: $e');
        return null;
      }
    }


  Future<String?> getToken()  {
    return  Storage.read( key: 'auth_token');
  }

  Future<void> removeToken() async {
    await Storage.deleteAll();
  }

  Future<bool> saveToken(String token) async {
    await Storage.write(key: 'auth_token', value: token);
    return true;
  }

  onLoginSuccess(String token){
    saveToken(token);
    print("Saved Successfully");
  }
  onLogout(){
    removeToken();
  }

  storeUser(UserModel User) async {
    String userJson  = jsonEncode(User);
    await Storage.write(key: 'auth_user', value: userJson);
  }
}




