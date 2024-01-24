class UserModel {
  int? userId;
  String? email;
  String? password;
  String? name;
  String? phone;

  UserModel.fromJson(Map m) {
    userId = m['userId'];
    password = m['password'];
    email = m['email'];
    name = m['name'];
    phone = m['phone'];
  }
}
