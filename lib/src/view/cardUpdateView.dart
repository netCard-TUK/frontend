import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/shared/global.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:frontend/src/widget/image_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

final GetStorage _storage = GetStorage();

//명함 수정 페이지
class CardUpdate extends StatefulWidget {
  @override
  _CardUpdateState createState() => _CardUpdateState();
}

class _CardUpdateState extends State<CardUpdate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tellController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  final cardController = Get.put(CardController());

  int? fileId;

  //이미지 가져오는 함수
  // Future getImage(ImageSource imageSource) async {
  //   //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
  //   final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path); //가져온 이미지를 image에 저장
  //     });
  //   }
  // }

  void uploadImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    int id = await cardController.upload(image.name, image.path);
    setState(() {
      fileId = id;
    });
  }

  void _withdrawAlertForm(BuildContext context) async {
    //알림창
    return showDialog<void>(
        // 다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false, // 다이얼로그 이외의 바탕을 눌러도 안꺼지도록 설정
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Text('등록 실패'),
            actions: [
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _withdrawAlertForm2(BuildContext context) async {
    //알림창
    return showDialog<void>(
        // 다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false, // 다이얼로그 이외의 바탕을 눌러도 안꺼지도록 설정
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Text('등록 성공!'),
            actions: [
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //저장 버튼을 눌렀을 때 실행되는 함수
  void _saveFrom() async {
    final String position = _positionController.text;
    final String organization = _organizationController.text;
    final String address = _addressController.text;
    final String email = _emailController.text;
    final int tell = int.parse(_tellController.text);

    //저장 로직 추가
    bool result = await cardController.cardRegister(
        position, organization, address, tell, email, fileId);

    if (result == true) {
      _withdrawAlertForm2(context);
      Get.back();
    } else {
      _withdrawAlertForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        title: Text('명함 수정'),
      ),
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.fromLTRB(30, 15, 30, 5),
          children: [
            ImageButton(
              imageUrl: fileId == null
                  ? null
                  : "${Global.apiRoot}/api/cards/register/",
              onTap: uploadImage,
            ),

            const SizedBox(height: 10),
            //직함
            TextFormField(
                controller: _positionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '직함을 입력하세요';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '직함',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffC4DCED)),
                  ),
                )),
            const SizedBox(height: 10),
            //소속
            TextFormField(
                controller: _organizationController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '소속을 입력하세요';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '소속',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffC4DCED)),
                  ),
                )),
            const SizedBox(height: 10),
            //회사 주소
            TextFormField(
                controller: _addressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '회사 주소를 입력하세요';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '회사 주소',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffC4DCED)),
                  ),
                )),
            const SizedBox(height: 10),
            //이메일
            TextFormField(
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력하세요';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '이메일',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffC4DCED)),
                  ),
                )),
            const SizedBox(height: 10),

            //회사 전화번호
            TextFormField(
                controller: _tellController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '회사 전화번호를 입력하세요';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: '회사 전화번호',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Color(0xffC4DCED)),
                  ),
                )),

            const SizedBox(height: 20),
            //수정버튼
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '수정',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffC4DCED),
                  textStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
