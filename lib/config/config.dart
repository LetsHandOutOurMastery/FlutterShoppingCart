import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' as json;

class Config {
  String baseUrl;
  String accessToken;
  String homeCmsBlockId;
  String apiPathDefault;
  String apiPath;
  Map<String, String> headers = Map<String, String>();
  Map<String, String> headersLogin = Map<String, String>();
  Future initialized;
  Map<String, dynamic> storeConfig;

  Config() {
    initialized = init();
  }

  init() async {
    final configJson = await loadAsset();
    final config = json.jsonDecode(configJson);
    baseUrl = config['base_url'];
    accessToken = config['access_token'];
    homeCmsBlockId = config['home_cms_block_id'];
    apiPath = '${baseUrl}rest';
    apiPathDefault = '${baseUrl}rest/default';
    headers['Authorization'] = 'Bearer ${this.accessToken}';
    headers['Content-Type'] = 'application/json';
    headersLogin['Content-Type'] = 'application/json';
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config/config.json');
  }

  setStoreConfig(Map<String, dynamic> storeConfiguration) {
    print('setStoreConfig');
    storeConfig = storeConfiguration;
  }

  String getMediaUrl() {
    return '${storeConfig['base_media_url']}';
  }

  String getProductMediaUrl() {
    return '${storeConfig['base_media_url']}catalog/product';
  }
}

Config config = Config();
