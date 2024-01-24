import 'package:frontend/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

final GetStorage _storage = GetStorage();

final ImagePicker _picker = ImagePicker();

//명함 관련 통신을 담당하는 클래스
class CardConnect extends GetConnect {
  //카드 등록 통신
  get getUserId => _storage.read("userId");
  get getToken => _storage.read("access_token");
  

  // get getUserId => "1";
  // get getToken =>
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA1OTk2ODczfQ.cDt-5txoj-YwI53SIvucrqBRHrTU_zConfr8-CzTelo";

  getMyCardList() async {
    Response response = await get(
      '/api/cards',
      query: {'page': "0", 'size': "10"},
      headers: {
        'userId': await getUserId,
        'access_token': await getToken,
      },
    );

    print(response.body);

    if (response.statusCode == null) throw Exception('통신 에러');

    Map<String, dynamic> body = response.body;

    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  // 모든 명함 정보 전체 조회
  getAllCardList({int page = 0}) async {
    Response response = await get(
      '/api/cards',
      query: {'page': page.toString(), 'size': "10"},
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  // 명함 만든사람 검색 조회
  getCardListByUsername(String name) async {
    Response response = await get(
      '/api/cards/search/list/$name',
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  //이미지 업로드
  imageUpload(String name, String path) async{
    final form = FormData({'file': MultipartFile(path,filename:name)});

    Response response = await post ('api/cards/register', form);
    Logger().i(response.statusCode);
    if(response.statusCode == null) throw Exception('통신에러');
    return response.body;
  }


  cardRegister(String position, String organization, String address, int tell, String email, {int? photo}) async{
    Response response = await post(
      'api/cards/register',
      {
        
        'userId': await getUserId,
        'organization': organization,
        'address': address,
        'tell': tell,
        'email': email,
        if(photo != null) 'photo': photo,
      },
      headers: {
        'acess_token' : await getToken
      },
    );
    if(response.statusCode == null) throw Exception('통신에러');
    Map<String, dynamic> body = response.body;
    if(body['result'] == 'fail') {
      throw Exception(body['message']);
    }
    Logger().i(body);
    return body['data'];
    
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
