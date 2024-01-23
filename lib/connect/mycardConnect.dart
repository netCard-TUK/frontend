import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../shared/global.dart';


final GetStorage _storage = GetStorage();

class MyCardConnect extends GetConnect {

  // get getUserId => _storage.read("userId");
  // get getToken => _storage.read("access_token");

  get getUserId => "1";
  get getToken => "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA1OTk2ODczfQ.cDt-5txoj-YwI53SIvucrqBRHrTU_zConfr8-CzTelo";

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

  // storeItem(String title, String price, String content, {int? imageId}) async {
  //   Response response = await post(
  //     '/api/feed',
  //     {
  //       'title': title,
  //       'price': price,
  //       'content': content,
  //       if (imageId != null) 'imageId': imageId,
  //     },
  //     headers: {'token': await getUserId},
  //   );
  //   if (response.statusCode == null) throw Exception('통신 에러');
  //   Map<String, dynamic> body = response.body;
  //   if (body['result'] == 'fail') {
  //     throw Exception(body['message']);
  //   }
  //   return body['data'];
  // }


  @override
  void onInit() {
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  // showItem(int id) async {
  //   Response response = await get(
  //     '/api/feed/$id',
  //     headers: {'token': await getUserId},
  //   );
  //   if (response.statusCode == null) throw Exception('통신 에러');
  //   Map<String, dynamic> body = response.body;
  //   if (body['result'] == 'fail') {
  //     throw Exception(body['message']);
  //   }
  //   return body['data'];
  // }
}
