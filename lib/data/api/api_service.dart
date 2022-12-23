import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restaurant_app_api_submission/common/constants/strings.dart';
import 'package:restaurant_app_api_submission/data/models/detail_data.dart';
import 'package:restaurant_app_api_submission/data/models/get_list_data.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:restaurant_app_api_submission/data/models/search_data.dart';

class AppService {
  Client _client() {
    return http.Client();
  }

  Uri _getURIS(String path,
      {String host = AppStrings.baseUrl, required Map<String, String> params}) {
    debugPrint("API GET $host$path $params");
    return Uri.https(host, path, params);
  }

  Future<ListData> fetchListData() async {
    String url = "/list";
    final uri = _getURIS(url, params: {});
    final response = await http.get(uri);
    print("Response Body : ${response.body}");
    print("Response Url : ${uri}");
    return ListData.fromJson(jsonDecode(response.body));
  }

  Future<SearchData> searchListData(String query) async {
    String url = "/search";
    final uri = _getURIS(url, params: {"q": query});
    final response = await http.get(uri);
    print("Response Body : ${response.body}");
    print("Response Url : ${uri}");
    return SearchData.fromJson(jsonDecode(response.body));
  }

  Future<DetailData> getDetailData(String id) async {
    // String url = "/detail";
    // final uri = _getURIS(path, params: params)
    final uri = Uri.https(AppStrings.baseUrl, '/detail/$id', {});
    final response = await http.get(uri);
    print("Response Body : ${response.body}");
    print("Response Url : ${uri}");
    return DetailData.fromJson(jsonDecode(response.body));
  }
}
