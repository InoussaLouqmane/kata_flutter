class EventModel {
  final String id;
  final String? title;
  final String? description;
  final double? cost;
  final DateTime startDate;
  final DateTime endDate;
  final String? address;
  final String? type;
  final String? userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  EventModel({
    required this.id,
    this.title,
    this.description,
    this.cost,
    required this.startDate,
    required this.endDate,
    this.address,
    this.type,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString(),
      description: json['description']?.toString(),
      cost: json['cost'] != null
          ? double.tryParse(json['cost'].toString())
          : 0.0,
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'].toString())
          : DateTime.now(),
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'].toString())
          : DateTime.now().add(const Duration(hours: 1)),
      address: json['address']?.toString(),
      type: json['type']?.toString(),
      userId: json['user_id']?.toString(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'].toString())
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'].toString())
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cost': cost,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'address': address,
      'type': type,
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'EventModel{'
        'id: $id, '
        'title: $title, '
        'description: $description, '
        'cost: $cost, '
        'startDate: $startDate, '
        'endDate: $endDate, '
        'address: $address, '
        'type: $type, '
        'userId: $userId, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt}';
  }


  }




