import 'package:flutter/material.dart';
import 'package:frontend/connect/cardConnect.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:frontend/src/view/mycardView.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

final cardConnect = Get.put(CardConnect());

  

//명함 관련 모든 상태를 공통으로 관리하는 컨트롤러
class CardController extends GetxController{

  CardModel? card;


  List<CardModel> list = [];

  //명함 조회
  getMyCardList() async {
    var name = await cardConnect.getMyCardList();

    // print("name");
    // print(name);

    // List jsonData = name;

    List jsonData = await cardConnect.getMyCardList();
    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  //명함 등록
  Future<bool> cardRegister(String position, String organization, String address, int tell, String email, int? photo) async{
    try{
      await cardConnect.cardRegister(position, organization, address, tell, email, photo: photo);
      // await feedIndex();
      return true;
    }catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),));
      return false;
    }
  }
  //이미지 업로드
  Future<int> upload(String name, String path) async{
    Map data = await cardConnect.imageUpload(name,path);
    return data['id'];
  }

}