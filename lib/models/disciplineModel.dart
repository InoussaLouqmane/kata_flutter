import 'package:kata_mobile_frontui/constants/disciplineConstants.dart';

class DisciplineModel{

  late final int id;
  late final String name;
  late final String status;

  DisciplineModel({
    required this.id,
    required this.name,
    required this.status
});

  factory DisciplineModel.fromJSON(Map<String, dynamic> data){

    return DisciplineModel(
        id: data[Disciplineconstants.ID] as int,
        name: data[Disciplineconstants.NAME] as String,
        status: data[Disciplineconstants.STATUS] as String
    );
  }

}