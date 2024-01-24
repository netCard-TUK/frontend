import 'package:flutter/material.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/cardController.dart';

final cardController = Get.put(CardController());

class SearchListItem extends StatefulWidget {
  final CardModel model;

  const SearchListItem(this.model, {super.key});

  @override
  State<SearchListItem> createState() => _SearchListItemState();
}

class _SearchListItemState extends State<SearchListItem> {
  void _detailSubmitForm() async {
    //검색 결과 명함 상세을 누를때 로직
    Navigator.pushNamed(context, '/detail');
  }

  void _add() async {
    //검색 결과 명함 추가을 누를때 로직
    await cardController.addCard(widget.model.cardId!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => FeedShow(model: model));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 사진
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("${widget.model.photo}",
                width: 120,
                height: 190, errorBuilder: (context, error, stackTrace) {
              return Image.asset('asset/logo.png', width: 120, height: 180);
            }),
          ),
          // 이름, 소속
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.model.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 6),
                    Text("소속 : ${widget.model.organization}",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black,
                        ))
                  ],
                )),
          ),
          // 버튼
          Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 100,
              child: Row(
                children: [
                  // 상세 버튼
                  ElevatedButton(
                    onPressed: () {
                      _detailSubmitForm();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: const Size(80, 70),
                      backgroundColor: const Color(0xffC4DCED),
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ), // 원하는 크기 설정
                    ),
                    child: const Text('상세'),
                  ),
                  const SizedBox(width: 10),
                  // 추가 버튼
                  ElevatedButton(
                    onPressed: () {
                      _add();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      fixedSize: const Size(80, 70),
                      backgroundColor: const Color(0xffC4DCED),
                      textStyle: const TextStyle(
                        fontSize: 17,
                      ), // 원하는 크기 설정
                    ),
                    child: const Text('추가'),
                  ),
                  const SizedBox(width: 10),
                ],
              ))
        ],
      ),
    );
  }
}
