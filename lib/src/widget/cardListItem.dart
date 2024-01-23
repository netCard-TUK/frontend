import 'package:flutter/material.dart';
import 'package:frontend/src/model/cardModel.dart';


class CardListItem extends StatelessWidget {
  final CardModel model;

  const CardListItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(() => FeedShow(model: model));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 썸네일
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network("${model.photo}",
                width: 100, height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('asset/logo.png', width: 100, height: 100);
                }
            ),
          ),
          // 내용
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(model.name ?? '제목 없음',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(model.address ?? '내용 없음'),
                    const SizedBox(height: 6),
                    Text("${model.email}원",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ))
                  ],
                )),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: 100,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16),
                    SizedBox(width: 4),
                    Text('1'),
                    SizedBox(width: 6),
                    Icon(Icons.comment_outlined, size: 16),
                    SizedBox(width: 4),
                    Text('1'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
