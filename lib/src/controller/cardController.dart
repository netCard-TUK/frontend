import 'package:flutter/material.dart';
import 'package:frontend/connect/cardConnect.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

final cardConnect = Get.put(CardConnect(_storage));

  

//명함 관련 모든 상태를 공통으로 관리하는 컨트롤러
class CardController extends GetxController{

  CardModel? card;


  List<CardModel> list = [];

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
    List jsonData = await cardConnect.getAllCardList(page : page);
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

  

  //명함 지갑 조회

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

}