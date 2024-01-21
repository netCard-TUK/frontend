import 'package:flutter/material.dart';
import 'package:frontend/src/view/mainView.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //final userController = Get.put(registerController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  final RegExp phoneRegex =
      RegExp(r'^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$');
  //회원가입 완료 버튼을 누를 때, 동작할 함수
  void _submitForm() async {
    //현재 폼에서 별다른 오류가 없을 때
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text; //이메일
      final String password = _passwordController.text; //비밀번호
      final String name = _nameController.text; //이름
      final String phone = _phoneController.text; // 전화번호

      // 회원가입 로직 추가
      // 안드로이드앱은 localhost가 아니라 직접 ip 입력해야함
      //bool result = await userController.register(email, name, password);

      // 회원가입 성공 시, 다음 화면으로 이동 혹은 처리
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text(
        '회원가입',
        textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC4DCED),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            //이메일 입력부분
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: '이메일',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이메일을 입력하세요.';
                }
                if (!emailRegex.hasMatch(value)) {
                  return '이메일 형식에 맞지 않습니다.';
                }
                return null;
              },
            ),

            //비밀번호 입력부분
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: '비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요.';
                }
                if (value.length < 5) {
                  return '비밀번호가 너무 짧습니다.';
                }
                return null;
              },
            ),

            //이름 입력부분
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: '이름',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력하세요.';
                }
                if (value.length < 2) {
                  return '이름이 너무 짧습니다.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            //전화번호 입력부분
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: '전화번호 (000-0000-0000)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Color(0xffC4DCED)),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '전화번호를 입력하세요.';
                }
                if (!phoneRegex.hasMatch(value)) {
                  return '전화번호 형식이 아닙니다.';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            //회원가입 완료 부분
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text(
                '회원가입 완료',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffC4DCED),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
