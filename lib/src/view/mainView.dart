import 'package:flutter/material.dart';
import 'package:frontend/src/widget/NoneCard.dart';
import 'package:frontend/src/widget/bottomNavigation.dart';
import 'package:frontend/src/widget/searchListItem.dart';
import 'package:frontend/src/widget/walletListItem.dart';
import 'package:get/get.dart';

import '../controller/cardController.dart';
import '../widget/cardListItem.dart';
import '../widget/searchListItem.dart';

final CardController cardController = Get.put(CardController());

//클래스명: Main
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final TextEditingController _searchController = TextEditingController();

  int page = 0;

  Future<void> _onRefresh() async {
    page = 0;
    cardController.clearCard();

    if (_searchController.text.isNotEmpty) {
      await cardController.getCardListByUsername(_searchController.text);
      return;
    }
    await cardConnect.getAllCardList(page: page);
  }

  bool _onNotification(ScrollNotification scrollInfo) {
    if (_searchController.text.isNotEmpty) return false;

    if (scrollInfo is ScrollEndNotification &&
        scrollInfo.metrics.extentAfter == 0) {
      cardController.getAllCardList(page: ++page);
      return true;
    }

    return false;
  }

  @override
  void initState() {
    super.initState();
    cardController.getAllCardList();
  }

  Future<void> _searchSubmitForm() async {
    //검색 버튼을 누를때 로직
    cardController.clearCard();

    cardController.list =
        await cardController.getCardListByUsername(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        //앱바
        appBar: AppBar(
          backgroundColor: Color(0xffC4DCED),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.search,
                color: Colors.black,
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 1,
                child: TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    hintText: '이름 혹은 소속으로 검색',
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              TextButton(
                onPressed: _searchSubmitForm,
                child: Text('검색'),
              ),
            ],
          ),
        ),

        //바텀네비게이션
        bottomNavigationBar: BottomNav(),

        //중단
        body: GetBuilder<CardController>(builder: (controller) {
          return NotificationListener<ScrollNotification>(
              onNotification: _onNotification,
              child: controller.list.length == 0
                  ? NoneCard()
                  : RefreshIndicator(
                      onRefresh: _onRefresh,
                      child: ListView.builder(
                        itemCount: controller.list.length,
                        itemBuilder: (context, index) {
                          return SearchListItem(controller.list[index]);
                        },
                      ),
                    ));
        }),
      ),
    );
  }
}
