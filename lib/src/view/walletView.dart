import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';

class Wallets extends StatelessWidget {
  const Wallets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Center(
        child: Text('내 명함 지갑 입니다'),
      ),
    );
  }
}