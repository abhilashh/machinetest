import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/HomeModel.dart';
import 'http_requests.dart';
class ServiceConfig {



  Future<dynamic> validateStatusCode(int statusCode, String? body) async {
    dynamic res;
    switch (statusCode) {
      case 200:
        res = await json.decode(body ?? '');
        break;
      case 202:
        res = await json.decode(body ?? '');
        break;
      case 203:
        res = await json.decode(body ?? '');
        break;
      case 500:
        res = {};
        break;
    }
    return res ?? {};
  }
  Future<HomeModel?> getHomeData() async {
   HomeModel?  homeModel;
    try {
      http.Response? _resp = await getRequest('69ad3ec2-f663-453c-868b-513402e515f0');
      dynamic res = await validateStatusCode(_resp.statusCode, _resp.body);
      if (res != null && res.isNotEmpty) {
        print(_resp.body);
        homeModel = HomeModel.fromJson(res);
      }
      log(res.toString(), name: 'Home Data');
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return homeModel;
  }
}
enum LoadState {
  loading,
  loaded,
  error,
  networkError,}
