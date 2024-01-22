import 'package:flutter/material.dart';
import 'package:frontend/connect/userConnect.dart';
import 'package:frontend/src/model/userModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

//회원 동작과 관련된 모든 상태들을 공통으로 관리하는 컨트롤러

class UserController extends GetxController{
  // UserConnect 객체를 생성 (의존성 주입)
  final userConnection = Get.put(UserConnect());

  //공통으로 관리할 멤버변수
  UserModel? user;

  //로그인이 되어있는지 판단
  Future<bool> isLogin() async {
    return _storage.hasData('access_token');
  }

  //회원가입을 시도하는 함수, connect 호출할 것임
  Future<bool> register(String email, String name, String password, String phone) async{
    try{
      String token = await userConnection.sendRegister(email, name, password, phone);
      await _storage.write('access_token',token);
      return true;
    }catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
      return false;
    }

  }
  
  //로그인하는 함수, connect 호출할 것임
  Future<bool> login (String email, String password) async{
    try{
      String token = await userConnection.sendLogin(email, password);
      await _storage.write('access_token', token);
      return true;
    }catch(e){
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text("$e"),
      ));
      return false;
    }
  }
  
  //나의 정보를 가져오는 함수, connect 호출할 것임
  Future mypage() async{
    Map map = await userConnection.getMyInfo();
    UserModel parseUser = UserModel.fromJson(map);
    user = parseUser;
  }
}