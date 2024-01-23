import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:get/get.dart';

import '../shared/global.dart';
import '../widget/image_button.dart';

class Wallets extends StatefulWidget {
  const Wallets({super.key});

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String? userId = Get.parameters['userId'];
  final String? name = Get.parameters['name'];
  final String? organization = Get.parameters['organization'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      appBar: AppBar(
        title: const Text(
          '명함 지갑',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffC4DCED),
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: 10, // 데이터 개수
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // 사진, 이름, 소속
                  ImageButton(
                    imageUrl: userId == null
                        ? null
                        : "${Global.apiRoot}/api/wallets/users/$userId",
                    onTap: () {},
                  ),
                  const SizedBox(width: 10),
                  Text("$name/$organization",
                      style: const TextStyle(fontSize: 30)),
                  const SizedBox(width: 30),

                  // 삭제 버튼
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: const Size(80, 70),
                      backgroundColor: const Color(0xffC4DCED),
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    child: const Text('삭제'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
