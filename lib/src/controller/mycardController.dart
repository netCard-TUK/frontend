import 'package:flutter/material.dart';
import 'package:frontend/connect/mycardConnect.dart';
import 'package:get/get.dart';

import '../model/cardModel.dart';


final myCardConnect = Get.put(MyCardConnect());

class MyCardController extends GetxController {
  List<CardModel> list = [];

  getMyCardList() async {
    var name = await myCardConnect.getMyCardList();

    print("name");

    print(name);

    List jsonData = name;

    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  // Future<bool> feedCreate(
  //     String title, String price, String content, int? imageId) async {
  //   try {
  //     await myCardConnect.storeItem(title, price, content, imageId: imageId);
  //     await feedIndex();
  //     return true;
  //   } catch (e) {
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
  //       content: Text('$e'),
  //     ));
  //     return false;
  //   }
  // }

  // Future<bool> feedShow(int id) async {
  //   try {
  //     Map m = await myCardConnect.showItem(id);
  //     return m['is_me'];
  //   } catch (e) {
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
  //       content: Text("$e"),
  //     ));
  //     return false;
  //   }
  // }
  //
  // Future<bool> feedDelete(int id) async {
  //   try {
  //     String result = await myCardConnect.deleteItem(id);
  //     print("result : $result}");
  //     list.removeWhere((element) => element.id == int.parse(result));
  //     update();
  //     return true;
  //   } catch (e) {
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
  //       content: Text("$e"),
  //     ));
  //     return false;
  //   }
  // }
  //
  // Future<int> upload(String name, String path) async {
  //   Map data = await myCardConnect.imageUpload(name, path);
  //   return data['id'];
  // }
}
