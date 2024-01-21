import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

class CardRegister extends StatelessWidget {
  const CardRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Center(
        child: Text('명함 등록페이지 입니다'),
        ),
    );
  }
}