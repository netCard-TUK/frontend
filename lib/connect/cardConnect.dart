import 'package:frontend/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import '../src/model/userModel.dart';

final GetStorage _storage = GetStorage();

//명함 관련 통신을 담당하는 클래스
class CardConnect extends GetConnect {
  //카드 등록 통신

  // get getUserId => _storage.read("userId");
  // get getUserName => _storage.read("name");
  // get getToken => _storage.read("access_token");

  get getUserId => "1";
  get getUserName => "김민수";
  get getToken =>
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA1OTk2ODczfQ.cDt-5txoj-YwI53SIvucrqBRHrTU_zConfr8-CzTelo";

  // 내 명함 리스트 조회
  getMyCardList() async {
    Response response = await get(
      '/cards',
      query: {'page': "0", 'size': "10"},
      headers: {'access_token': await getUserId},
    );

    print(response.body);

    if (response.statusCode == null) throw Exception('통신 에러');

    Map<String, dynamic> body = response.body;

    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  // 내 지갑 명함 리스트 조회
  getMyWalletList() async {
    Response response = await get(
      '/wallets/users',
      query: {'page': "0", 'size': "10"},
      headers: {'access_token': await getUserId},
    );

    print(response.body);

    if (response.statusCode == null) throw Exception('통신 에러');

    Map<String, dynamic> body = response.body;

    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['cards'];
  }

  // 명함 상세 정보 조회
  getDetailList() async {}

  // 이름으로 명함 검색 리스트
  getCardByNameList() async {}

  // 명함 등록 메서드
  Future cardRegister(String name, String phone, String position,
      String organization, String address, String email, String tell) async {
    Response response = await post('/api/cards/register', {
      'name': name,
      'phone': phone,
      'position': position,
      'organization': organization,
      'address': address,
      'email': email,
      'tell': tell,
    });
    //로그 찍어보기
    Logger().i(response.printError);
    Logger().i(response.statusCode);

    if (response.statusCode == null) throw Exception('통신에러');
    Map<String, dynamic> body = response.body;

    if (body['result'] == 'fail') {
      throw Exception(body['message']);
    }

    Logger().i(body['access_token']);

    return body['access_token'];
  }

  @override
  void onInit() {
    // GetConnect 초기화
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}
