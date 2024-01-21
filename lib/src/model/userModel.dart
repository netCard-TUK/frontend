class UserModel{
  int? id;
  String? email;
  String? name;
  String? phone;

  UserModel.fromJson(Map m){
    id = m['id'];
    email = m['email'];
    name = m['name'];
    phone = m['phone'];
  }
}