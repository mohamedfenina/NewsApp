


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static late  Dio dio;
  static String baseUrl = "https://api.spaceflightnewsapi.net/";


  static init(){
    dio = Dio(

      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),




      )
    );



    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Print the request details
          print('Sending request: $options');
          print('Method: ${options.method}');
          print('URL: ${options.uri}');
          print('Headers: ${options.headers}');
          print('Body: ${options.data}');

          // Continue with the request
          return handler.next(options);
        },



        onError: (DioException e, ErrorInterceptorHandler handler) {

          print('""""""""""""""""""""""""""""""""""object""""""""""""""""""""""""""""""""""');

          print('error ${e.response?.statusCode  }');

          DioException errorWithMessage = DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            error: {
              'message': e.response?.data['errors'],
              'msg': e.message,
              'code':e.response?.statusCode,
            },
            type: e.type,
          );

          return handler.next(errorWithMessage);

        },


      ),
    );




  }

  static Future<Response> getData ({
    required String url,
     Object? data,
     Map<String,dynamic>? query,
     Map<String,dynamic>? header,

  }) async {
    return await dio.get(url,data:data,queryParameters: query,
    options: Options(headers: header));
  }
  static Future<Response> postData ({
    required String url,
    Object? data,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,


  }) async {
    return await dio.post(url, data:data,queryParameters: query,
        options: Options(headers: header));
  }


  static Future<Response> putData ({
    required String url,
    Object? data,
    Map<String,dynamic>? query,
    Map<String,dynamic>? header,


  }) async {
    return await dio.put(url, data:data,queryParameters: query,
        options: Options(headers: header));
  }


}