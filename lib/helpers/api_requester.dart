import 'package:dio/dio.dart';

class ApiRequester {
  // static String url = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54";

  Dio _initDio(String myUrl) {
    return Dio(
      BaseOptions(
          baseUrl: myUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          responseType: ResponseType.json,),
    );
  }

  Future<Response> toGet(String path) {
    Dio dio = _initDio(path);

    try {
      return dio.get('');
    } catch (e) {
      print('error api :$e');
      throw '';
    }
  }

}
