import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:image_picker/image_picker.dart';

//명함 등록 페이지
class CardRegister extends StatefulWidget {
  @override
  _CardRegisterState createState() => _CardRegisterState();
}

class _CardRegisterState extends State<CardRegister> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tellController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  File? _image;

  //이미지 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        title: Text('사진 및 정보 등록'),
      ),
      body: Expanded(
        child: ListView(
          padding: EdgeInsets.fromLTRB(30, 15, 30, 5),
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC4DCED),
              ),
              onPressed: (){
                getImage(ImageSource.camera);
              },
              child: _image == null
                  ? Container(
                      width: 150,
                      height: 150,
                      color: Colors.grey,
                      child: Center(
                        child: Icon(Icons.camera_alt, size: 50, color: Colors.white),
                      ),
                    )
                  : Image.file(
                      _image!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(height: 20),
            //이름
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: '이름',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),
            //전화번호
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: '전화번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),
            //직함
            TextField(
              controller: _positionController,
              decoration: const InputDecoration(
                hintText: '직함',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),
            //소속
            TextField(
              controller: _organizationController,
              decoration: const InputDecoration(
                hintText: '소속',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),
            //회사 주소
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: '회사 주소',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),
            //이메일
            TextField(
              controller: _emailController,
             decoration: const InputDecoration(
                hintText: '이메일',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
            const SizedBox(height: 10),

            //회사 전화번호
            TextField(
              controller: _tellController,
             decoration: const InputDecoration(
                hintText: '회사 전화번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              )
            ),
      
            const SizedBox(height: 20),
            //저장버튼
            ElevatedButton(
              onPressed: (){},
              child: Text(
                '저장',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC4DCED),
                textStyle: TextStyle(color: Colors.black, )
              ),
            ),
          ],
        ),
      ),
    );
  }
}


