// import 'package:frontend/connect/feedConnect.dart';
// import 'package:frontend/src/model/cardModel.dart';
// import 'package:get/get.dart';

// final feedConnect = Get.put(FeedConnect());

// class FeedController extends GetxController{
//   List <CardModel> list = [];

//   feedIndex() async {
//     //FeedConnect를 통해 서버에서부터 List를 가져옴
//     List jsonData = await feedConnect.getList();
    
//     //List<Map>을 모델인 List<Model> 로 변경
//     List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();

//     //변경된 tmp를 상태관리변수 list에다가 넣어줌
//     list = tmp;

//     //UI 업데이트를 알려준다
//     update();
//   }
// }