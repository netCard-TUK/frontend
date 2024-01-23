import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  void _walletsSubmitForm() async {
    //내 명함 지갑 버튼을 누를때 로직
    Navigator.pushNamed(context, '/wallets');
  }

  void _cardsSubmitForm() async {
    //내 명함 확인 버튼을 누를때 로직
    Navigator.pushNamed(context, '/cards');
  }

  void _withdrawAlertForm(BuildContext context) async {
    //회원 탈퇴 버튼을 누를때 로직
    return showDialog<void>(
        // 다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false, // 다이얼로그 이외의 바탕을 눌러도 안꺼지도록 설정
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Text('정말로 탈퇴하시겠습니까?'),
            actions: [
              TextButton(
                child: Text('취소'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
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

  void _logoutAlertForm(BuildContext context) async {
    //로그아웃 버튼을 누를때 로직
    return showDialog<void>(
        // 다이얼로그 위젯 소환
        context: context,
        barrierDismissible: false, // 다이얼로그 이외의 바탕을 눌러도 안꺼지도록 설정
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('알림'),
            content: Text('정말로 로그아웃하시겠습니까?'),
            actions: [
              TextButton(
                child: Text('취소'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNav(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //내 명함 지갑
            ElevatedButton(
              onPressed: _walletsSubmitForm,
              child: Text('내 명함 지갑'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70),
                backgroundColor: Color(0xffC4DCED),
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ), // 원하는 크기 설정
              ),
            ),

            const SizedBox(height: 16),

            //내 명함 확인
            ElevatedButton(
              onPressed: () {
                _cardsSubmitForm();
              },
              child: Text('내 명함 확인'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70),
                backgroundColor: Color(0xffC4DCED),
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  fontSize: 20,
                ), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 16),
            //회원 탈퇴
            ElevatedButton(
              onPressed: () {
                _withdrawAlertForm(context);
              },
              child: Text('회원 탈퇴'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70),
                backgroundColor: Color(0xffC4DCED),
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 16),
            //로그아웃
            ElevatedButton(
              onPressed: () {
                _logoutAlertForm(context);
              },
              child: Text('로그아웃'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70),
                backgroundColor: Color(0xffC4DCED),
                onPrimary: Colors.black,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 30),
            // 버전 정보
            const Text("버전 정보 0.0.1")
          ],
        ),
      ),
    );
  }
}
