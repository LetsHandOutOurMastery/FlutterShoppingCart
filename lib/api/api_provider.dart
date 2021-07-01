import 'dart:convert' as json;
import 'package:http/http.dart' show Client;
import 'package:shoppingcart/models/login_model.dart';
import 'dart:async';
import 'api_call_repository.dart';
import '../config/config.dart';


class MagentoApiProvider implements Source {
  Client client = Client();

  Future<String> fetchHomeConfig() async {
    print('fetchHomeConfig');
    await config.initialized;
    final response = await client.get(Uri.parse('${config.apiPathDefault}/V1/cmsBlock/${config.homeCmsBlockId}'),
      headers: config.headers,
    );
    final cmsData = json.jsonDecode(response.body);
    String statusCode = response.statusCode.toString();
    print('statusCode: $statusCode');
    String requestURL = response.request.url.toString();
    print('request url: $requestURL');
    String responseBody = response.body.toString();
    print('responseBody: $responseBody');
    return cmsData['content'] as String;
  }

  Future<String> fetchStoreConfig() async {
    print('fetchStoreConfig');
    await config.initialized;
    final response = await client.get(Uri.parse('${config.apiPathDefault}/V1/store/storeConfigs'),
      headers: config.headers,
    );
    String statusCode = response.statusCode.toString();
    print('statusCode: $statusCode');
    String requestURL = response.request.url.toString();
    print('request url: $requestURL');
    String responseBody = response.body.toString();
    print('responseBody: $responseBody');
    return response.body.toString();
  }

  Future<String> fetchLogin(LoginModel request) async {
    print('fetchLogin');
    await config.initialized;
    String encodeJson = json.jsonEncode(request.toDatabaseJson());
    print('encodeJson: $encodeJson');
    final response = await client.post(Uri.parse('${config.apiPath}/V1/integration/customer/token'),
      headers: config.headersLogin,
      body: encodeJson,
    );
    String statusCode = response.statusCode.toString();
    print('statusCode: $statusCode');
    String requestURL = response.request.url.toString();
    print('request url: $requestURL');
    String responseBody = response.body.toString();
    print('responseBody: $responseBody');
    return response.body.toString();
  }

  Future<Token> getToken(LoginModel userLogin) async {
    String encodeJson = json.jsonEncode(userLogin.toDatabaseJson());
    print('encodeJson: $encodeJson');
    final response = await client.post(Uri.parse('${config.apiPath}/V1/integration/customer/token'),
      headers: config.headersLogin,
      body: encodeJson,
    );
    if (response.statusCode == 200) {
      //print('token: ${response.body}');
      var token = Token();
      token.token = response.body;
      return token;
    } else {
      throw Exception(json.jsonDecode(response.body));
    }
  }

  Future<String> fetchProductsForCategory({int categoryId, int pageSize = 10, int offset = 0}) async {
    final currentPage = (offset / pageSize + 1).toInt();
    final params = <String, dynamic>{
      'searchCriteria[filterGroups][0][filters][0][field]': 'category_id',
      'searchCriteria[filterGroups][0][filters][0][value]': categoryId,
      'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq',
      'searchCriteria[filterGroups][1][filters][0][field]': 'visibility',
      'searchCriteria[filterGroups][1][filters][0][value]': '4',
      'searchCriteria[filterGroups][1][filters][0][conditionType]': 'eq',
      'searchCriteria[pageSize]': pageSize,
      'searchCriteria[currentPage]': currentPage
    };

    String paramsString = '';
    String separator = '?';
    params.forEach((key, value) {
      paramsString = '$paramsString$separator$key=$value';
      separator = '&';
    });

    final response = await client.get(Uri.parse('${config.apiPathDefault}/V1/products$paramsString'),
      headers: config.headers,
    );

    final body = response.body;
    print(body);

    return response.body;
  }
}
