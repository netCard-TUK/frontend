import 'package:flutter/material.dart';
import 'package:frontend/shared/global.dart';
import 'package:frontend/src/model/cardModel.dart';

class FeedListItem extends StatelessWidget {
  final CardModel model;
  const FeedListItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //썸네일
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          //수정필수
          child: Image.network(
            "${Global.apiRoot}/cards/search/${model.cardId}",
            width: 100, 
            height: 100,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('asset/logo.png', width: 100, height: 100);
            },
          ),
        ),
        //내용
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? '이름',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(model.organization ?? '회사'),
              const SizedBox(height: 6),
              // Text(model.phone ?? '번호'),
            ],
          ),
        ),
      ],
    );
  }
}