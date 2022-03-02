import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.spacexdata.com/v4/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

   static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };

    return await dio.post(url, data: data);
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.put(
      url,
      data: data,
    );
  }
}
