import 'package:flutter/material.dart';
import 'package:frontend/src/view/app.dart';
import 'package:frontend/src/view/mycardView.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

void main() async {
  // await _storage.write("userId", "1");
  // await _storage.write("access_token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA1OTk2ODczfQ.cDt-5txoj-YwI53SIvucrqBRHrTU_zConfr8-CzTelo");
  // var hasData = _storage.hasData("userId");



  
  // get http://http://3.37.150.108:8000

  // var testConnect = TestConnect();
  // testConnect.onInit();

  // var a = await testConnect.getList();

  runApp(const MyApp());
}
