import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

class MyPage extends StatefulWidget{
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
                textStyle: TextStyle(
                  color: Colors.black,
                ), // 원하는 크기 설정
              ),
            ),

            const SizedBox(height: 16),

            //내 명함 확인
            ElevatedButton(
              onPressed: _cardsSubmitForm,
              child: Text('내 명함 확인'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 16),
            //회원 탈퇴
            ElevatedButton(
              onPressed: () {
                // 버튼3 클릭 시 수행할 작업
              },
              child: Text('회원 탈퇴'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 16),
            //로그아웃
            ElevatedButton(
              onPressed: () {
                // 버튼4 클릭 시 수행할 작업
              },
              child: Text('로그 아웃'),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 70), // 원하는 크기 설정
              ),
            ),
            const SizedBox(height: 16),
            // 버전 정보
          ],
        ),
      ),
    );
  }
}
