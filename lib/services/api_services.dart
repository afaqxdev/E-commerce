import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/config/api_exception.dart';
import 'package:task_app/services/base_api.dart';

import '../const/app_strings.dart';

class ApiService implements BaseApiServices {
  final String apiKey;

  ApiService({this.apiKey = ''});

  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    if (apiKey.isNotEmpty) 'Authorization': 'Bearer $apiKey',
  };

  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      if (kDebugMode) {
        print(AppStrings.getRequestLog.replaceFirst('%s', url));
      }

      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw RequestTimeOutException(AppStrings.requestTimedOut);
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      if (kDebugMode) {
        print(AppStrings.postRequestLog.replaceFirst('%s', url));
        print(AppStrings.postBodyLog.replaceFirst('%s', data.toString()));
      }

      final encodedData = jsonEncode(data);

      final response = await http
          .post(Uri.parse(url), headers: headers, body: encodedData)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw RequestTimeOutException(AppStrings.requestTimedOut);
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> putApi(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      if (kDebugMode) {
        print(AppStrings.putRequestLog.replaceFirst('%s', url));
        print(AppStrings.putBodyLog.replaceFirst('%s', data.toString()));
      }

      final String encodedData = data is String ? data : jsonEncode(data);

      final response = await http
          .put(Uri.parse(url), headers: headers, body: encodedData)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw RequestTimeOutException(AppStrings.requestTimedOut);
    }
    return jsonResponse;
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      if (kDebugMode) {
        print(AppStrings.deleteRequestLog.replaceFirst('%s', url));
      }

      final response = await http
          .delete(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 50));

      jsonResponse = returnResponse(response);
    } on SocketException {
      throw NoInternetException(AppStrings.noInternetConnection);
    } on TimeoutException {
      throw RequestTimeOutException(AppStrings.requestTimedOut);
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        return jsonDecode(response.body);
      case 401:
        throw UnAuthorisedException(AppStrings.unauthorizedRequest);
      case 403:
        throw UnAuthorisedException(AppStrings.forbiddenRequest);
      case 404:
        throw FetchDataException(AppStrings.resourceNotFound);
      case 500:
        throw FetchDataException(
          AppStrings.serverError.replaceFirst(
            '%s',
            response.statusCode.toString(),
          ),
        );
      default:
        throw FetchDataException(
          AppStrings.unexpectedError.replaceFirst(
            '%s',
            response.statusCode.toString(),
          ),
        );
    }
  }
}
