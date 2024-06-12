import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/core/configs/sharedpreferences.dart';
import 'package:kata_mobile_frontui/core/constants/app_strings.dart';
import 'package:kata_mobile_frontui/modules/Widget/Snackbars.dart';
import 'package:http/http.dart' as http;



  checkCredential(String email, String password) async{
  final url = Uri.http(AppConstants.SERVER_API_URL, '/api/loginSPA');
  final response = await http.post(
      headers: {
        "Content-Type" : "application/json",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip, deflate, br",
        "Connection" : "keep-alive"
      },
      url,
      body: jsonEncode({'email' : email, 'password': password})
  );
  if(response.statusCode == 200){
    print(response.body);
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    onLoginSuccess(decodedResponse['token']);
  }
  }


  void onLogout(){
    removeToken();
  }

  void onLoginSuccess(String token){
    saveToken(token);
  }
