class UserModel{
  int? userId;
  String? email;
  String? password;
  String? name;
  String? phone;
  bool? isActive;

  UserModel.fromJson(Map m){
    userId = m['userId'];
    password = m['passwors'];
    email = m['email'];
    name = m['name'];
    phone = m['phone'];
    isActive = m['isActive'];
  }
}