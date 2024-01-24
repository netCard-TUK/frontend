import 'package:frontend/connect/cardConnect.dart';
import 'package:frontend/src/model/cardModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

final cardConnect = Get.put(CardConnect());

//명함 관련 모든 상태를 공통으로 관리하는 컨트롤러
class CardController extends GetxController {
  CardModel? card;

  List<CardModel> list = [];

  getMyCardList() async {
    var name = await cardConnect.getMyCardList();

    print("name");

    print(name);

    List jsonData = name;

    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  getMyWalletList() async {
    var name = await cardConnect.getMyWalletList();

    print("name");
    print(name);

    List jsonData = name;

    List<CardModel> tmp = jsonData.map((m) => CardModel.parse(m)).toList();
    list.addAll(tmp);
    update();
  }

  Future<bool> cardRegister(String name, String phone, String position,
      String organization, String address, String email, String tell) async {
    try {
      String token = await cardConnect.cardRegister(
          name, phone, position, organization, address, email, tell);
      await _storage.write('access_token', token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
