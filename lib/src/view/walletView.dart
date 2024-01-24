import 'package:flutter/material.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:get/get.dart';

import '../widget/bottomNavigation.dart';
import '../widget/walletListItem.dart';

final cardController = Get.put(CardController());

class Wallets extends StatefulWidget {
  const Wallets({super.key});

  @override
  State<Wallets> createState() => _WalletsState();
}

class _WalletsState extends State<Wallets> {
  Future<void> _onRefresh() async {
    cardController.clearCard();
    await cardController.getAddingCardList();
  }

  @override
  void initState() {
    cardController.clearCard();
    cardController.getAddingCardList();
    super.initState();
  }

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
      body: GetBuilder<CardController>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView.builder(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return WalletListItem(controller.list[index]);
              }),
        );
      }),
    );
  }
}
