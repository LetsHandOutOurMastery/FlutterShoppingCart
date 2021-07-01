import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:shoppingcart/models/login_model.dart';


final _base = "http://gpm.digitalcloudways.com/";
final _tokenEndpoint = "rest/V1/integration/customer/token";
final _tokenURL = _base + _tokenEndpoint;
Map<String, String> headersLogin = Map<String, String>();


Future<Token> getToken(LoginModel userLogin) async {
  print(_tokenURL);
  Client client = new Client();
  headersLogin['Content-Type'] = 'application/json';
  final response = await client.post(Uri.parse(_tokenURL),
    headers: headersLogin,
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    var token = Token();
    token.token = response.body;
    return token;
  } else {
    print(response.body.toString());
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
