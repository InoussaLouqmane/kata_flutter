

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:kata_mobile_frontui/configs/sharedpreferences.dart';
import 'package:kata_mobile_frontui/models/UserModel.dart';
import 'package:http/http.dart' as http;
import '../constants/app_strings.dart';

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





}