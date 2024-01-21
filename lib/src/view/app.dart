import 'package:flutter/material.dart';
import 'package:frontend/src/view/cardRegisterView.dart';
import 'package:frontend/src/view/index.dart';
import 'package:frontend/src/view/loginView.dart';
import 'package:frontend/src/view/mainView.dart';
import 'package:frontend/src/view/mycardView.dart';
import 'package:frontend/src/view/mypageView.dart';
import 'package:frontend/src/view/registerView.dart';
import 'package:frontend/src/view/walletView.dart';
import 'package:frontend/src/widget/feedListItem.dart';

import 'mycardView.dart';
import 'walletView.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      routes: {
        '/myPage': (context) => MyPage(),
        '/home': (context) => Main(),
        '/cardRegister':(context) => CardRegister(),
        '/register':(context) => Register(),
        '/login':(context) => Login(),
        '/cards':(context) => Cards(),
        '/wallets': (context) => Wallets(),
        '/search': (context) => FeedIndex(),
      },
      initialRoute: '/',
      home: Login(),
    );
  }
}
