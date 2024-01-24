import 'package:dio/dio.dart' as dioConn;
import 'package:dio/dio.dart';
import 'package:get/get_connect.dart' as connect;
import 'package:frontend/shared/global.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

// final GetStorage _storage = GetStorage();
final ImagePicker _picker = ImagePicker();

//명함 관련 통신을 담당하는 클래스
class CardConnect extends GetConnect {
  //카드 등록 통신

  // int? getInt(String userId) => GetStorage().read(userId);
  // String? getToken (String token) => GetStorage().read(token);
  final GetStorage _storage;
  CardConnect(this._storage);

  get getUserId => _storage.read("userId");
  get getToken => _storage.read("access_token");

  // get getUserId => "1";
  // get getToken =>
  //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA1OTk2ODczfQ.cDt-5txoj-YwI53SIvucrqBRHrTU_zConfr8-CzTelo";

  //내명함지갑

  //내명함정보
  getMyCardList() async {
    String accessToken = _storage.read('access_token') ?? '';
    String userId = _storage.read('userId') ?? '';
    connect.Response response = await get(
      '/api/cards',
      query: {'page': "0", 'size': "10"},
      headers: {
        'userId': userId.toString(),
        'access_token': accessToken,
      },
    );

    if (response.statusCode == null) throw Exception('통신 에러');

    Map<String, dynamic> body = response.body;

    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  //내 지갑에 명함 추가
  addCard(int cardId) async {
    String accessToken = _storage.read('access_token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA2MDg0MTYwfQ.Yep1MjQA0eJVHM57GLfYP1vp8qg6c4IHzVRW3mvbUNk';
    String userId = _storage.read('userId') ?? '1';

    print("userId: $userId");

    Map<String, String> requestBody = {
      'userId': userId.toString(),
      'cardId': cardId.toString(),
    };

    connect.Response response = await post(
      '/api/wallets',
      requestBody,
      headers: {
        'access_token': accessToken,
      },
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }

    print(body);
    return;
  }

  // 모든 명함 정보 전체 조회
  getAllCardList({int page = 0}) async {
    connect.Response response = await get(
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
    connect.Response response = await get(
      '/api/cards/search/list/$name',
    );
    if (response.statusCode == null) throw Exception('통신 에러');
    Map<String, dynamic> body = response.body;
    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['result'];
  }

  cardRegister(
    String position,
    String organization,
    String address,
    int tell,
    String email,
    dynamic photo,
  ) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;
      print(1);
      dioConn.FormData formData = dioConn.FormData.fromMap({
        'userId': getUserId,
        'position': position,
        'organization': organization,
        'address': address,
        'tell': tell,
        'email': email,
      });
      formData.files.add(MapEntry(
        'photo',
        await dioConn.MultipartFile.fromFile(photo),
      ));

      print(formData.fields[0]);
      print(formData.fields[4]);
      print(getToken);
      dio.options.headers = {'access_token': getToken};
      var response = await dio.post(
        '${Global.apiRoot}/api/cards/register',
        data: formData,
      );
      print(response);
    } catch (e) {
      print(e);
    }
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

  // 추가한 명함들 조회
  getAddingCardList({int page = 0}) async {
    String accessToken = _storage.read('access_token') ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNzA2MDg0MTYwfQ.Yep1MjQA0eJVHM57GLfYP1vp8qg6c4IHzVRW3mvbUNk';
    String userId = _storage.read('userId') ?? '1';
    connect.Response response = await get(
      '/api/wallets/users/$userId',
      query: {'page': page.toString(), 'size': "1000"},
      headers: {
        'access_token': accessToken,
      },
    );

    if (response.statusCode != 200) throw Exception('통신 에러');

    Map<String, dynamic> body = response.body;
    print("body");
    print(body);

    if (body['isSuccess'] == false) {
      throw Exception(body['message']);
    }
    return body['cards'];
  }
}
