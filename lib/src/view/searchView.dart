import 'package:flutter/material.dart';
import 'package:frontend/src/controller/cardController.dart';
import 'package:get/get.dart';

import '../widget/bottomNavigation.dart';
import '../widget/searchListItem.dart';

final cardController = Get.put(CardController());

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
          '검색 결과',
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
                return SearchListItem(controller.list[index]);
              }),
        );
      }),
    );
  }
}
