import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'app_data.dart';



Future<http.Response> postRequest(String endpoint, Map? parameters) async {
  final url = AppData.baseUrl + endpoint;
  log("URL :: $url + $endpoint + $parameters");
  dynamic response;
  try {
    response = await http.post(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
      body: parameters != null ? json.encode(parameters) : null,
    ).timeout(const Duration(seconds: 60));

  } on Exception catch (error) {
    if (error.toString().contains('SocketException')) {
    }
  }
   return response;
}

Future<http.Response> getRequest(String endpoint) async {
  final url = AppData.baseUrl + endpoint;
  log("URL :: $url + $endpoint");
  var client = http.Client();
  dynamic response;
  try {
    response = await client.get(Uri.parse(url), headers: <String, String>{
      HttpHeaders.contentTypeHeader: "application/json",
      // HttpHeaders.authorizationHeader: await SharedPreferencesHelper.getHeaderToken()
    },).timeout(const Duration(seconds: 60));
  } on Exception catch (error) {
    if (error.toString().contains('SocketException')) {
    }
  }
  return response;
}


