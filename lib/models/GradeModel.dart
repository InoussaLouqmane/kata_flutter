class GradeModel {
  final int id;
  final String beltName;
  final String beltColor;
  final int disciplineId;
  final String? beltPicturePath;
  final DateTime createdAt;
  final DateTime updatedAt;

  GradeModel({
    required this.id,
    required this.beltName,
    required this.beltColor,
    required this.disciplineId,
    this.beltPicturePath,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GradeModel.fromJson(Map<String, dynamic> json) {
    return GradeModel(
      id: json['id'] as int,
      beltName: json['beltName'] as String,
      beltColor: json['beltColor'] as String,
      disciplineId: json['disciplineId'] as int,
      beltPicturePath: json['beltPicturePath'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'beltName': beltName,
      'beltColor': beltColor,
      'disciplineId': disciplineId,
      'beltPicturePath': beltPicturePath,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'GradeModel{id: $id, beltName: $beltName, beltColor: $beltColor, '
        'disciplineId: $disciplineId, '
        'beltPicturePath: $beltPicturePath, createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }
}