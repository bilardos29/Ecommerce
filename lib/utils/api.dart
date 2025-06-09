import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiMethod {
  static const GET = "GET";
  static const POST = "POST";
  static const PUT = "PUT";
  static const DELETE = "DELETE";
}

class Api {
  String apiMethod;

  dynamic path;
  dynamic headers;
  dynamic data;
  dynamic queryString;

  Api(
      {this.apiMethod = ApiMethod.GET,
      this.path,
      this.headers,
      this.data,
      this.queryString});

  Map<String, dynamic> get finalHeader {
    Map<String, dynamic> _finalHeader = {
      // "Content-Type": "application/x-www-form-urlencoded",
    };
    return headers == null ? _finalHeader : headers;
  }

  request(
      {VoidCallback? onTokenExpired,
      required ValueChanged<String> onError,
      required ValueChanged<dynamic> onSuccess}) async {
    try {
      var url = 'https://fakestoreapi.com$path';
      //print('url dio $url header $finalHeader, $apiMethod');
      var options = Options(
          responseType: ResponseType.json,
          headers: finalHeader,
          method: apiMethod);
      var response = await Dio()
          .request(url,
              options: options, data: data, queryParameters: queryString)
          .timeout(Duration(seconds: 20));
      onSuccess(response.data);
    } on DioError catch (error) {
      if (error.response == null) {
        onError("Terjadi kesalahan. Silahkan coba lagi");
        return;
      }

      print('err ${error.response}');
      onError(error.response.toString());
    } catch (e) {
      onError("Terjadi kesalahan. Silahkan coba lagi (2)");
    }
  }
}
