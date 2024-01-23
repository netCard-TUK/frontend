import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mycardController.dart';
import '../widget/cardListItem.dart';

final myCardController = Get.put(MyCardController());

class MyCardsView extends StatefulWidget {
  const MyCardsView({super.key});

  @override
  State<MyCardsView> createState() => _MyCardsViewState();
}

class _MyCardsViewState extends State<MyCardsView> {
  Future<void> _onRefresh() async {
    await myCardController.getMyCardList();
  }

  @override
  void initState() {
    super.initState();
    myCardController.getMyCardList();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyCardController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return CardListItem(controller.list[index]);
            }),
      );
    });
  }
}
