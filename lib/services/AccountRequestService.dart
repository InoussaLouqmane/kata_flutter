import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kata_mobile_frontui/models/AccountRequestModel.dart';
import '../configs/sharedpreferences.dart';
import '../constants/app_strings.dart';


class AccountRequestService{

  final AccountRequestModel AccountRequest;
  AccountRequestService({required this.AccountRequest});

  final sessionService = SessionService();




  Future<http.Response> sentRequest() async {

    final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_POSTULATE);

    final AccountRequestBody = {
      'firstName' : AccountRequest.firstName,
      'lastName' : AccountRequest.lastName,
      'email' : AccountRequest.email,
      'martialArtType' : AccountRequest.martialArtType,
      'licenseId': AccountRequest.licenseId,
      'grade' : AccountRequest.grade,
      'clubName' : AccountRequest.clubName,
      'clubAddress' : AccountRequest.clubAddress,
      'role': AccountRequest.role,
      'phone' : AccountRequest.phone,
      'genre' : AccountRequest.genre
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

      return response;

    }catch(e){
      print(e);
      throw Exception('Failed to send account request: $e');
    }
  }

  Future<int> ValidateRequest() async {

    int id  = AccountRequest.id;
    final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_VALIDATE);

    try{
      final response = await http.post(
          headers: AppConstants.requestHeader,
          url,
          body: jsonEncode({'id' : id})
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

  Future<int> RejectRequest() async {

    int id  = AccountRequest.id;
    final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.ACCOUNT_REQUEST_REJECT);

    try{
      final response = await http.post(
          headers: AppConstants.requestHeader,
          url,
          body: jsonEncode({'id' : id})
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