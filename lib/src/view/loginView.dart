import 'package:flutter/material.dart';
import 'package:frontend/src/controller/userController.dart';
import 'package:frontend/src/view/mainView.dart';
import 'package:frontend/src/view/registerView.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //아이디&비밀번호
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPwController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  final userController = Get.put(UserController());
  
  //로그인 완료 버튼을 누를 때, 동작할 함수
  void _submitForm() async {
    //현재 폼에서 별다른 오류가 없을 때
    if (_formKey.currentState!.validate()) {
      final String email = _userEmailController.text; //이메일
      final String password = _userPwController.text; //비밀번호
    
      //TODO: 로그인 로직추가
      bool result = await userController.login(email, password);

      if(result){
        Get.offAll(()=> const Login());
      }
    }

  

    //회원가입 성공 시, 다음화면으로 이동 혹은 처리
    // Navigator.pushNamed(context, '/home');
  }

  void _registerSubmitForm() async {
    //회원가입 버튼을 누를때 로직
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '로그인',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC4DCED),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 40),
            Image.asset('asset/logo.png'),
            const SizedBox(height: 40),
            //이메일 입력부분
            const SizedBox(height: 20),
            TextFormField(
              controller: _userEmailController,
              decoration: const InputDecoration(
                hintText: '이메일',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),

              //이메일 입력때 유효성 검사
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이메일을 입력하세요.';
                }
                //TODO: 올바르지 않은 이메일 일때 로직 구현
                return null;
              },
            ),

            //비밀번호 입력부분
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: _userPwController,
              decoration: const InputDecoration(
                hintText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),

              //비밀번호 입력때 유효성 검사
              validator: (value) {
                // TODO: 비밀번호가 올바르지 않을때의 로직 구현
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요.';
                }
                if (value.length < 5) {
                  return '비밀번호가 너무 짧습니다.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            //로그인 완료 부분
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text(
                '로그인하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC4DCED),
              ),
            ),
            ElevatedButton(
              onPressed: _registerSubmitForm,
              child: const Text(
                '회원가입하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
