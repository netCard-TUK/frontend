import 'package:flutter/material.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:get/get.dart';

import '../shared/global.dart';
import '../widget/image_button.dart';
import '../model/cardModel.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String? photo = Get.parameters['photo'];
  final String? name = Get.parameters['name'];
  final String? organization = Get.parameters['organization'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      appBar: AppBar(
        title: const Text(
          '내 명함',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color(0xffC4DCED),
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
                  Image.network(
                    "${Global.apiRoot}/api/cards/$photo",
                  ),
                  const SizedBox(width: 10),
                  Text("$name/$organization",
                      style: const TextStyle(fontSize: 30)),
                  const SizedBox(width: 30),

                  Column(children: [
                    // 수정 버튼
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
                        child: const Text('수정')),
                    const SizedBox(height: 13),
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
                        child: const Text('삭제')),
                  ])
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
