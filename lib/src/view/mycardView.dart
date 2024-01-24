import 'package:flutter/material.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:get/get.dart';

import '../widget/cardListItem.dart';
import '../widget/bottomNavigation.dart';

final cardController = Get.put(CardController());

class MyCardsView extends StatefulWidget {
  const MyCardsView({super.key});

  @override
  State<MyCardsView> createState() => _MyCardsViewState();
}

class _MyCardsViewState extends State<MyCardsView> {
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
          '내 명함',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffC4DCED),
      ),
      body: GetBuilder<CardController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return CardListItem(controller.list[index]);
              }),
        );
      }),
    );
  }
}
