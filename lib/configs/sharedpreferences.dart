import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:kata_mobile_frontui/models/UserModel.dart";
import "package:shared_preferences/shared_preferences.dart";

class SessionService{
  final Storage  = const FlutterSecureStorage();

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

  onLoginSuccess(token){
    saveToken(token);
    print("Saved Successfully");
  }
  onLogout(){
    removeToken();
  }
}




