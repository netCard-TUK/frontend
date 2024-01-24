import 'package:frontend/shared/global.dart';
import 'package:frontend/src/view/mainView.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

final GetStorage _storage = GetStorage();

//회원 관련된 통신을 담당하는 클래스
class UserConnect extends GetConnect{
  
  //회원가입 통신
  Future sendRegister(String email, String name, String password, String phone) async {
    
    Response response = await post('/api/users/register',
    {
        'email' : email,
        'name' : name,
        'password' : password,
        'phone' : phone
    });

    //로그 찍어보기
    Logger().i(response.statusCode);

    if(response.statusCode == null) throw Exception('통신에러');
    Map<String, dynamic> body = response.body;

    if(body['isSuccess'] == 'fail'){
      throw Exception(body['message']);
    }
    Logger().i(body);
  
    return body['access_token'];
  }

  //로그인 통신
  Future<Map<String, dynamic>> sendLogin(String email, String password) async {
    Response response = await post('/api/users/login',
    {
        'email' : email,
        'password' : password,
    });

    Logger().i(response.body);
    Logger().i(response.statusCode);

    Map<String, dynamic> body = response.body;
  
    if(body['isSuccess'] == 'fail'){
      throw Exception(body['message']);
    }
    Logger().i(response.body['access_token']);

    return body;
  }


  get getToken async{
    return _storage.read("accessToken");
  }

  get getUserId async{
    return _storage.read("userId");
  }

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
}
