import 'package:dio/dio.dart';

class DigHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> qur}) async {
    return await dio!.get(url, queryParameters: qur);
  }
}
