import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Center(
        child: Text('내 명함 확인 입니다'),
      ),
    );
  }
}