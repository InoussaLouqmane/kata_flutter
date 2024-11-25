
class UserModel {
    late final int id;
    late final int firstAttempt;
    late final String status;
    late final String firstName;
    late final String lastName;
    late final String email;
    late final String? phone;
    late final String role;
    late final String genre;
    late final String? photoPath;
    late final String? bioDescription;
    late final int grade;
    late final String? licenseID;
    late final String password;
    late final DateTime createdAt;

    UserModel(
        {required this.id,
        required this.firstAttempt,
        required this.status,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.role,
        required this.genre,
        required this.grade,
        required this.password,
        required this.createdAt,
        this.bioDescription,
        this.phone,
        this.photoPath,
        this.licenseID});

    factory UserModel.fromJson(Map<String, dynamic> data) {

      var createdAt = DateTime.parse(data['created_at'] as String);

      return UserModel(
          id: data['id'] as int,
          firstAttempt: data['first_attempt'] as int,
          status: data['status'] as String,
          firstName: data['firstName'] as String,
          lastName: data['lastName'] as String,
          email: data['email'] as String,
          role: data['role'] as String,
          genre: data['genre'] as String,
          grade: data['grade'] as int,
          password: data['password'] as String,
          createdAt: createdAt ,
          bioDescription: data['bioDescription'] as String? ?? '',
          photoPath: data['photoPath'] as String? ?? '',
          phone: data['phone'] as String? ?? '',
          licenseID: data['licenseId'] as String? ?? ''
      );
    }


    Map<String, dynamic> toJson() =>{
      'id' : id,
      'first_attempt' : firstAttempt,
      'status' : status,
      'firstName' : firstName,
      'lastName' : lastName,
      'email' : email,
      'role' : role,
      'genre' : genre,
      'grade' : grade,
      'password' : password,
      'created_at' : createdAt.toIso8601String(),
      'bioDescription' : bioDescription,
      'photoPath' : photoPath,
      'phone' : phone,
      'licenseId' : licenseID
    };
  }
