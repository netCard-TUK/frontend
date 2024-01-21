import 'package:flutter/material.dart';

//하단 네비게이션 바
class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Color(0xffC4DCED),
        onTap: (int index){
          switch(index){
            //홈
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            
            //마이페이지
            case 1:
              Navigator.pushNamed(context, '/myPage');
              break;

            //명함등록
            case 2:
              Navigator.pushNamed(context, '/cardRegister');
              break;
            
            default:
          }
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label:'홈화면'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label:'마이페이지'),
          BottomNavigationBarItem(icon: Icon(Icons.contacts), label:'명함등록')
        ],
    );
  }
}