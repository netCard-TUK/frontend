// import 'package:flutter/material.dart';
// import 'package:frontend/src/controller/cardController.dart';
// import 'package:get/get.dart';

// import '../widget/bottomNavigation.dart';
// import '../widget/DetailItem.dart';

// final cardController = Get.put(CardController());

// class CardDetail extends StatefulWidget {
//   const CardDetail({super.key});

//   @override
//   State<CardDetail> createState() => _CardDetailState();
// }

// class _CardDetailState extends State<CardDetail> {
//   Future<void> _onRefresh() async {
//     await cardController.getMyCardList();
//   }

//   @override
//   void initState() {
//     super.initState();
//     cardController.getMyCardList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: const BottomNav(),
//       appBar: AppBar(
//         title: const Text(
//           '명함 상세 정보',
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xffC4DCED),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:frontend/src/widget/DetailItem.dart'; // Import DetailItem widget
import 'package:get/get.dart';

import '../widget/bottomNavigation.dart';

final cardController = Get.put(CardController());

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  Future<void> _onRefresh() async {
    await cardController.getMyCardList();
  }

  @override
  void initState() {
    super.initState();
    cardController.getMyCardList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      appBar: AppBar(
        title: const Text(
          '명함 상세 정보',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffC4DCED),
      ),
      body: GetBuilder<CardController>(
        builder: (controller) {
          // 단일 데이터를 표시하는 예제
          if (controller.list.isNotEmpty) {
            // controller.list의 첫 번째 항목을 사용
            return DetailItem(controller.list.first);
          } else {
            // 데이터가 없는 경우 표시할 UI
            return Center(
              child: Text('데이터가 없습니다.'),
            );
          }
        },
      ),
    );
  }
}
