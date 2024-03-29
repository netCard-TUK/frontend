import 'package:flutter/material.dart';
import 'package:frontend/connect/cardConnect.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

final cardConnect = Get.put(CardConnect(_storage));

//명함 관련 모든 상태를 공통으로 관리하는 컨트롤러
class CardController extends GetxController {
  CardModel? card;

  List<CardModel> list = [];

  // list delete
  void deleteCard(CardModel model) async {
    list.removeWhere((element) => element.cardId == model.cardId);
    update();
  }

  // list clear
  void clearCard() {
    list.clear();
  }

  // 내가 추가한 모든 명함 조회
  getAddingCardList() async {
    List jsonData = await cardConnect.getAddingCardList();

    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  //명함 조회
  getMyCardList() async {
    var name = await cardConnect.getMyCardList();

    List jsonData = await cardConnect.getMyCardList();
    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  // 모든 명함 정보 전체 조회
  Future<List<CardModel>> getAllCardList({int page = 0}) async {
    List jsonData = await cardConnect.getAllCardList(page: page);
    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
    return tmp;
  }

  // 명함 만든사람 검색 조회
  Future<List<CardModel>> getCardListByUsername(String name) async {
    List jsonData = await cardConnect.getCardListByUsername(name);
    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
    return tmp;
  }

  // 내 지갑에 명함 추가
  Future<bool> addCard(int cardId) async {
    try {
      await cardConnect.addCard(cardId);
      return true;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  // 내 지갑에서 명함 삭제

  //명함 지갑 조회

  // 명함 등록
  Future<bool> cardRegister(String position, String organization,
      String address, int tell, String email, dynamic photo) async {
    try {
      await cardConnect.cardRegister(
          position, organization, address, tell, email, photo);
      // await feedIndex();
      return true;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }

  Future<bool> cardUpdate(String position, String organization, String address,
      int tell, String email, dynamic cardId) async {
    try {
      await cardConnect.cardUpdate(
          position, organization, address, tell, email, cardId);
      // await feedIndex();
      return true;
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
      return false;
    }
  }
}
