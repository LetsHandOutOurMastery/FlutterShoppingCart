import 'dart:async';
import 'dart:convert' as json;
import 'package:shoppingcart/models/login_model.dart';

import 'api_provider.dart';
import '../models/product_model.dart';
// to check internet connection
import 'package:connectivity/connectivity.dart';

class MagentoRepository {
  List<Source> sources = <Source>[
    MagentoApiProvider(),
  ];

  Future<Map<String, dynamic>> fetchHomeData() async {
    String homeConfig;
    var source;

    for(source in sources) {
      homeConfig = await source.fetchHomeConfig();
      if (homeConfig != null) {
        break;
      }
    }

    print('homeConfig: $homeConfig');
    return json.jsonDecode(homeConfig);
  }

  Future<List<dynamic>> fetchStoreConfig() async {
    String config;
    var source;

    for(source in sources) {
      config = await source.fetchStoreConfig();
      if (config != null) {
        break;
      }
    }

    return json.jsonDecode(config);
  }

  Future<Token> fetchLogin(LoginModel request) async {
    String responseLogin;
    var source;

    for(source in sources) {
      responseLogin = await source.fetchLogin(request);
      if (responseLogin != null) {
        break;
      }
    }
    print('token: $responseLogin');
    var token = Token();
    token.token = responseLogin;
    return token;
  }

  Future<List<ProductModel>> getProducts(categoryId) async {
    final result = await MagentoApiProvider().fetchProductsForCategory(categoryId: categoryId);
    final decoded = json.jsonDecode(result);

    var products;
    if (decoded != null && decoded['items'] != null) {
       products = decoded['items'].map((item) {
        return ProductModel.fromJson(item);
      }).toList();
    }

    print('products');
    print(products);

    return List<ProductModel>.from(products);
  }
}

abstract class Source {
  Future<String> fetchStoreConfig();
  Future<String> fetchHomeConfig();
}

abstract class Cache {
  Future<int> addConfig(String name, String content);
  clear();
}

// method defined to check internet connectivity
Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

