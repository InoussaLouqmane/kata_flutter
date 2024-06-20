import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';
import '../Widget/Snackbars.dart';
import '../constants/app_strings.dart';

checkCredential(
  BuildContext context,
  String email,
  String password,
) async {

  final sessionService = SessionService();
  final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.LOGIN_URL);

  try {
    final response = await http.post(
        headers: AppConstants.requestHeader,
        url,
        body: jsonEncode({'email': email, 'password': password})
    );

    if (kDebugMode) {
      print(response.body);
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    if (response.statusCode == 200) {
      if(decodedResponse['user']['role'] == 'Admin'){
        try{
          await FirebaseMessaging.instance.subscribeToTopic("AccountRequestPending");
          if (kDebugMode) {
            print("Suscribed successfully");
          }
        } catch(e){
          if (kDebugMode) {
            print("$e");
          }
        }

      }
      sessionService.onLoginSuccess(decodedResponse['token']);
      ScaffoldMessenger.of(context)
          .showSnackBar(returnSuccessSnackbar(context, decodedResponse['message']));
    }else{
      ScaffoldMessenger.of(context)
          .showSnackBar(
          returnErrorSnackbar(context, decodedResponse['message']));
    }
  }catch(e){
    ScaffoldMessenger.of(context)
        .showSnackBar(
        returnErrorSnackbar(context, "Aucune connexion internet :$e"));
  }
}
