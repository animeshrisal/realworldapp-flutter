import 'package:dio/dio.dart';
import 'dart:convert';

class Network<T> {
  final String _endPoint = "http://192.168.31.55:4000";
  final Dio _dio = Dio();
  final String url;

  Network({this.url});

  Future getResponse(Map<String, dynamic> queryParameter) async {
    Response response =
        await _dio.get("$_endPoint$url", queryParameters: queryParameter);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future postRequest(T model) async {
    Response response = await _dio.post("$_endPoint$url", data: {});
    if (response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
