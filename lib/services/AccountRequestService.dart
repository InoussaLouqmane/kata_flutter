import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kata_mobile_frontui/models/AccountRequestModel.dart';
import '../Widget/Snackbars.dart';
import '../configs/sharedpreferences.dart';
import '../constants/app_strings.dart';


class AccountRequestService{

  final AccountRequestModel AccountRequest;
  AccountRequestService({required this.AccountRequest});

  final sessionService = SessionService();
  final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_POSTULATE);



  sentRequest() async {
    final token = sessionService.getToken() ;

    final AccountRequestBody = {
      'firstName' : AccountRequest.firstName,
      'lastName' : AccountRequest.lastName,
      'email' : AccountRequest.email,
      'martialArtType' : AccountRequest.martialArtType,
      'licenseId': AccountRequest.licenseId,
      'grade' : AccountRequest.grade,
      'clubName' : AccountRequest.clubName,
      'clubAddress' : AccountRequest.clubAddress,
    };

    try{
      final response = await http.post(
          headers: AppConstants.requestHeader,
          url,
          body: jsonEncode(AccountRequestBody)
      );

      if (kDebugMode) {
        print(response.body);
        print(response.statusCode);
      }

      return response.statusCode;

    }catch(e){
      print(e);
      return 101;
    }
  }

}