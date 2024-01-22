import 'package:frontend/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

class FeedConnect extends GetConnect {

  getList() async {
    Response response = await get(
      '/cards/all/search',
      headers: {'token': await getToken},
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if(body['result'] == 'fail'){
      throw Exception(body['message']);
    }
    return body['data'];
  }

  get getToken => _storage.read("access_token");
  
  @override
  void onInit(){
    allowAutoSignedCert = true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request){
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}