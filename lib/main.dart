import 'package:flutter/material.dart';
import 'package:frontend/src/view/app.dart';
import 'package:get/get.dart';

void main() async {
  // get http://http://3.37.150.108:8000

  var testConnect = TestConnect();
  testConnect.onInit();

  var a = await testConnect.getList();

  runApp(const MyApp());
}

class TestConnect extends GetConnect {
  getList() async {
    Response response = await get(
      '/api/cards/search/1',
    );
    print(response.body);
  }

  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = "http://3.37.150.108:8000";
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}
