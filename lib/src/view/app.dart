import 'package:flutter/material.dart';
import 'package:frontend/src/view/cardRegisterView.dart';
import 'package:frontend/src/view/cardUpdateView.dart';
import 'package:frontend/src/view/index.dart';
import 'package:frontend/src/view/loginView.dart';
import 'package:frontend/src/view/mainView.dart';
import 'package:frontend/src/view/mycardView.dart';
import 'package:frontend/src/view/mypageView.dart';
import 'package:frontend/src/view/registerView.dart';
import 'package:frontend/src/view/walletView.dart';
import 'package:frontend/src/view/searchView.dart';
import 'package:frontend/src/view/cardDetailView.dart';
// import 'package:frontend/src/widget/feedListItem.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      routes: {
        '/myPage': (context) => MyPage(),
        '/home': (context) => Main(),
        '/cardRegister': (context) => CardRegister(),
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/cards': (context) => MyCardsView(),
        '/wallets': (context) => Wallets(),
        '/search': (context) => SearchView(),
        '/detail': (context) => CardDetail(),
        '/update': (context) => CardUpdate(),
        // '/search': (context) => FeedIndex(),
      },
      initialRoute: '/',
      home: Main(),
    );
  }
}
