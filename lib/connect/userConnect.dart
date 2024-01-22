
import 'package:frontend/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();

//회원 관련된 통신을 담당하는 클래스
class UserConnect extends GetConnect{

  //회원가입 통신
  Future sendRegister(String email, String name, String password, String phone) async {
    Response response = await post('/api/user/register',{
        'email' : email,
        'name' : name,
        'password' : password,
        'phone' : phone,
    });
    if(response.statusCode == null) throw Exception('통신에러');
    Map<String, dynamic> body = response.body;

    if(body['result'] == 'fail'){
      throw Exception(body['message']);
    }
    return body['access_token'];
  }

  //로그인 통신
  Future sendLogin(String email, String password) async {
    Response response = await post('/api/user/register',{
        'email' : email,
        'password' : password,
    });

    Map<String, dynamic> body = response.body;

    if(body['result'] == 'fail'){
      throw Exception(body['message']);
    }
    return body['access_token'];
  }


  Future<Map> getMyInfo() async {
    Response response = await get('/api/user/mypage', headers: {'Authorization': 'Bearer ${await getToken}'});

    Map<String, dynamic> body = response.body;

    if(body['result'] == 'fail'){
      throw Exception(body['message']);
    }
    return body;
  }

  get getToken async{
    return _storage.read("accessToken");
  }

  @override
  void onInit(){
    allowAutoSignedCert=true;
    httpClient.baseUrl = Global.apiRoot;
    httpClient.addRequestModifier<void>((request){
      request.headers['Accept'] = 'application/json';
      return request;
    });
    super.onInit();
  }
}
