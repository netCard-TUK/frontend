import 'dart:io';

class CardModel {
  int? cardId;
  int? userId;
  String? position;
  String? organization;
  String? address;
  int? tell;
  String? email;
  String? name;
  int? phone;
  //이미지(photo) int로 변경
  dynamic photo;

  CardModel.parse(Map m) {
    cardId = m['card_id'];
    userId = m['user_id'];
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
