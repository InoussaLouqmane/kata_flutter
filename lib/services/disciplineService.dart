import 'package:kata_mobile_frontui/models/disciplineModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_strings.dart';

class DisciplineService{

Future<List<DisciplineModel>> getAllDisciplines() async {

  var urlPath = '/all';
  final url = Uri.http(AppConstants.SERVER_API_URL, AppConstants.DISCIPLINE_BASE_URL+urlPath);

  try{
    final response = await http.get(
      headers: AppConstants.requestHeader,
      url);

    if(response.statusCode == 200){

      final List disciplineList = jsonDecode(response.body) as List;
      final List<DisciplineModel> Disciplines = disciplineList.map(
              (discipline) => DisciplineModel.fromJSON(discipline as Map<String, dynamic>)
      ).toList();
      return Disciplines;
    }else{
      throw(Exception('Une erreur est survenue lors de la collecte des disciplines'));
    }

  }catch(e){
    throw Exception("Erreur lors de la collecte des disciplines : $e");
  }

}
}