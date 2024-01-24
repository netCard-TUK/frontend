import 'package:flutter/material.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:frontend/src/widget/image_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

final GetStorage _storage = GetStorage();

//명함 등록 페이지
class CardRegister extends StatefulWidget {
  @override
  _CardRegisterState createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tellController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  final cardController = Get.put(CardController());

  dynamic imageFile;
  

  Future<void> _withdrawAlertForm(BuildContext context) async {
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

  Future<void> _withdrawAlertForm2(BuildContext context) async {
    //알림창
    await showDialog<void>(
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

  Future<void> _saveForm() async {
    try {
      if (imageFile == null) {
        throw Exception('이미지가 선택되지 않았습니다.');
      }

      int tell = int.tryParse(_tellController.text) ?? 0;

      // 이미지 파일을 CardController로 직접 전달
      bool result = await cardController.cardRegister(
        _positionController.text,
        _organizationController.text,
        _addressController.text,
        tell,
        _emailController.text,
        imageFile,
      );
      print(result);
      if (result) {
        await _withdrawAlertForm2(context);
      }
      Get.back();
    } catch (e) {
      await _withdrawAlertForm(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        title: Text('명함 등록'),
      ),
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.fromLTRB(30, 15, 30, 5),
          children: [
            ImageButton(
              onTap: () async {
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    imageFile = image.path;
                  });
                }
              },
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
            //저장버튼
            ElevatedButton(
              onPressed: () => _saveForm(),
              child: Text(
                '저장',
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
