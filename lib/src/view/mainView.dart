import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

//클래스명: Main
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  void _searchSubmitForm() async {
    //검색 버튼을 누를때 로직
    Navigator.pushNamed(context, '/search');
  }

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 5,
      child:Scaffold(
        backgroundColor: Colors.white,
        //앱바
        appBar: AppBar(
        backgroundColor: Color(0xffC4DCED),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            SizedBox(
              width: 8,
            ),
            Flexible(
              flex: 1,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  hintText: '이름 혹은 소속으로 검색',
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: _searchSubmitForm,
              child: Text('검색'),
            ),
          ],
        ),
      ),
      
      //바텀네비게이션
      bottomNavigationBar: BottomNav(),
      
      //중단
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('asset/logo.png'),
            const SizedBox(height: 40),
            const Text(
              '검색해서 명함을 찾아보세요',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        )
      )
    );
  }
}