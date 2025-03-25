

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';
import 'package:kata_mobile_frontui/models/EventModel.dart';
import 'package:kata_mobile_frontui/models/PaymentsModel.dart';
import 'package:kata_mobile_frontui/models/UserModel.dart';
import 'package:http/http.dart' as http;
import '../constants/app_strings.dart';
import '../models/FeesModel.dart';

class Dataservice{

  SessionService sessionObject = new SessionService();

  Future<List<UserModel?>>getAllStudents() async {

    String urlPath='/all';
    final UserModel? user = await sessionObject.getCurrentUser();

    String? UserId = user?.id.toString();

    final url = Uri.http(AppConstants.SERVER_API_URL, '${AppConstants.STUDENT_BASE_URL}$urlPath/$UserId');
    if (kDebugMode) {
      print("Url is $url");
    }

    try{


      final response = await http.get(
          headers: AppConstants.requestHeader,
          url);

     print('body response is : ${response.body}');
      if (response.statusCode == 200) {
        // Décoder la réponse
        final List<dynamic> outerList = jsonDecode(response.body) as List;


        // Vérifier que la première entrée est une liste
        if (outerList.isNotEmpty && outerList[0] is List) {
          final List<dynamic> studentList = outerList[0] as List;


          // Mapper chaque élément en UserModel
          final List<UserModel> students = studentList.map((student) {
            return UserModel.fromJson(student as Map<String, dynamic>);
          }).toList();

          return students;
        } else {
          throw Exception('Structure inattendue dans la réponse JSON.');
        }
      }else {
        throw(Exception(
            'Une erreur est survenue lors de la collecte des students'));
      }
    }catch(e){
      throw Exception("Erreur lors de la collecte des students : $e");

    }

  }

  Future<List<EventModel?>>getAllEvents() async {

    String urlPath='/all';
    final UserModel? user = await sessionObject.getCurrentUser();

    String? UserId = user?.id.toString();

    final url = Uri.http(AppConstants.SERVER_API_URL, '${AppConstants.EVENT_BASE_URL}$urlPath/$UserId');
    if (kDebugMode) {
      print("Url is $url");
    }

    try{


      final response = await http.get(
          headers: AppConstants.requestHeader,
          url);

     print('body response is : ${response.body}');
      if (response.statusCode == 200) {
        // Décoder la réponse
        final List<dynamic> outerList = jsonDecode(response.body) as List;


        // Vérifier que la première entrée est une liste
        if (outerList.isNotEmpty && outerList[0] is List) {
          final List<dynamic> eventList = outerList[0] as List;


          // Mapper chaque élément en EventModel
          final List<EventModel> events = eventList.map((events) {
            return EventModel.fromJson(events as Map<String, dynamic>);
          }).toList();

          return events;
        } else {
          throw Exception('Structure inattendue dans la réponse JSON.');
        }
      }else {
        throw(Exception(
            'Une erreur est survenue lors de la collecte des students'));
      }
    }catch(e){
      throw Exception("Erreur lors de la collecte des students : $e");

    }

  }


  Future<List<FeesModel>> getAllFees() async {
    String urlPath = '/payments';
    final UserModel? user = await sessionObject.getCurrentUser();

    String? userId = user?.id.toString();

    final url = Uri.http(AppConstants.SERVER_API_URL, '${AppConstants.FEES_BASE_URL}$urlPath/$userId');

    if (kDebugMode) {
      print("Url is $url");
    }

    try {
      final response = await http.get(url, headers: AppConstants.requestHeader);

      if (kDebugMode) {
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        // Décoder la réponse
        final List<dynamic> jsonResponse = jsonDecode(response.body) as List<dynamic>;

        // Mapper chaque élément en FeesModel
        return jsonResponse.map((json) => FeesModel.fromJson(json as Map<String, dynamic>)).toList();
      } else {
        throw Exception('Erreur ${response.statusCode}: Impossible de récupérer les frais.');
      }
    } catch (e) {
      print("Erreur lors de la récupération des frais-fees: $e");
      return [];
    }
  }

  Future<List<PaymentModel?>>getTransactions(int paymentid) async {

    String urlPath='/transactions';
    final UserModel? user = await sessionObject.getCurrentUser();



    final url = Uri.http(AppConstants.SERVER_API_URL, '${AppConstants.TRANSACTIONS_BASE_URL}$urlPath/$paymentid');
    if (kDebugMode) {
      print("Url is $url");
    }

    try{


      final response = await http.get(
          headers: AppConstants.requestHeader,
          url);

     print('body response is : ${response.body}');
      if (response.statusCode == 200) {
        // Décoder la réponse
        final List<dynamic> outerList = jsonDecode(response.body) as List;


        // Vérifier que la première entrée est une liste
        if (outerList.isNotEmpty && outerList[0] is List) {
          final List<dynamic> feesList = outerList[0] as List;


          // Mapper chaque élément en EventModel
          final List<PaymentModel> transactions = feesList.map((transactions) {
            return PaymentModel.fromJson(transactions as Map<String, dynamic>);
          }).toList();

          return transactions;
        } else {
          throw Exception('Structure inattendue dans la réponse JSON.');
        }
      }else {
        throw(Exception(
            'Une erreur est survenue lors de la collecte des students'));
      }
    }catch(e){
      throw Exception("Erreur lors de la collecte des students : $e");

    }

  }






}