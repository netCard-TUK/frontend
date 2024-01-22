import 'package:flutter/material.dart';
import 'package:frontend/src/controller/feedController.dart';
import 'package:frontend/src/widget/feedListItem.dart';
import 'package:get/get.dart';

final feedController = Get.put(FeedController());

class FeedIndex extends StatefulWidget {
  const FeedIndex({super.key});

  @override
  State<FeedIndex> createState() => _FeedIndexState();
}

class _FeedIndexState extends State<FeedIndex> {

  @override
  void initState(){
    super.initState();
    feedController.feedIndex();
  }
 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeedController>(builder: (controller){
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: controller.list.length, //현재 listView의 아이템 개수
          itemBuilder: (context, index){
            //각각 ListView의 item이 어떻게 그려질지를 적어주는 builder
            return FeedListItem(controller.list[index]); 
          },
        );
    });
  }
}