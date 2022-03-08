class Users {
  //init var
  String id;
  String fullName;
  String username;
  String password;
  String email;
  String phoneNumber;
  String nik;
  String gender;
  String birthdate;
  String address;

  //constructor
  Users(
      {required this.id,
      required this.fullName,
      required this.username,
      required this.password,
      required this.email,
      required this.phoneNumber,
      required this.nik,
      required this.gender,
      required this.birthdate,
      required this.address});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        id: json['_id'] as String,
        fullName: json['_fullname'] as String,
        username: json['_username'] as String,
        password: json['_password'] as String,
        email: json['_email'] as String,
        phoneNumber: json['_phonenumber'] as String,
        nik: json['_nik'] as String,
        gender: json['_gender'] as String,
        birthdate: json['_birthdate'] as String,
        address: json['_address'] as String);
  }

  @override
  String toString() {
    return 'Users{id: $id, name: $fullName, age: $username}';
  }
}
