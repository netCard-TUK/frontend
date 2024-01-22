import 'dart:io';

class CardModel{
 int? cardId;
 int? userId;
 String? name; 
 String? position;
 String? organization;
 String? address;
 String? phone;
 String? email;
 File? photo;
 String? tell;

 CardModel.parse(Map m){
  cardId = m['cardId'];
  userId = m['userId'];
  name = m['name'];
  position = m['position'];
  organization = m['organization'];
  address = m['address'];
  phone = m['phone'];
  email = m['email'];
  photo = m['photo'];
  tell = m['tell'];
 }
}