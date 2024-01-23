import 'dart:io';

class CardModel {
  String? cardId;
  String? position;
  String? organization;
  String? address;
  int? tell;
  String? email;
  String? name;
  String? phone;
  //이미지(photo) int로 변경
  String? photo;

  CardModel.parse(Map m) {
    cardId = m['cardId'];
    name = m['name'];
    position = m['position'];
    organization = m['organization'];
    address = m['address'];
    phone = m['phone'];
    email = m['email'];
    photo = m['image'];
    tell = m['tell'];
  }
  
}
