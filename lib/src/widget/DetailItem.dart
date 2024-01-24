import 'package:flutter/material.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:get/get.dart';

class DetailItem extends StatelessWidget {
  final CardModel model;

  const DetailItem(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 사진
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network("${model.photo}",
                      width: 120,
                      height: 190, errorBuilder: (context, error, stackTrace) {
                    return Image.asset('asset/logo.png',
                        width: 120, height: 180);
                  }),
                ),
                const SizedBox(width: 20),
                // 이름, 소속
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text("${model.name}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        )),
                    const SizedBox(height: 6),
                    Text("${model.phone}",
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black,
                        ))
                  ],
                ),
              ]),
          Column(
            children: [
              const SizedBox(height: 20),
              Text("소속: ${model.organization}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10),
              Text("직함: ${model.position}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10),
              Text("이메일: ${model.email}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10),
              Text("주소: ${model.address}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10),
              Text("회사: ${model.tell}",
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 28,
                    color: Colors.black,
                  )),
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
