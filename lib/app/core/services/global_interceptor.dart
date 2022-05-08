import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';

enum RequestType {
  REQUEST,
  RESPONSE,
  ERROR,
}

class GlobalInterceptor extends Interceptor {
  final bool logActive = true;

  final JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    printLogger(
      host: err.requestOptions.uri.host,
      path: err.requestOptions.uri.path,
      method: err.requestOptions.method,
      statusCode: err.response?.statusCode,
      data: err.requestOptions.data,
      requestType: RequestType.ERROR,
    );
    final erro = DioError(error: err.response!.data['message'], requestOptions: err.requestOptions, response: err.response, type: err.type);
    return super.onError(erro, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    printLogger(
      host: options.uri.host,
      path: options.uri.path,
      method: options.method,
      data: options.data,
      requestType: RequestType.REQUEST,
    );

    options.headers.addAll({'appVersion': 'versao', 'userId': 1});

    // LoggerService.instance.v('Endpoint: ${options.uri}\n$prettyprint');

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printLogger(
      host: response.realUri.host,
      path: response.realUri.path,
      method: response.requestOptions.method,
      statusCode: response.statusCode,
      data: response.data,
      requestType: RequestType.RESPONSE,
    );

    //  LoggerService.instance.v('Endpoint: ${response.realUri}\n$prettyprint');

    return super.onResponse(response, handler);
  }

  printLogger({
    required RequestType requestType,
    required String host,
    required String path,
    required String method,
    int? statusCode,
    required dynamic data,
  }) {
    if (!logActive) return;

    String prettyprint = encoder.convert(data);

    switch (requestType) {
      case RequestType.REQUEST:
      case RequestType.RESPONSE:
        dev.log('--------------------[REQUEST]--------------------');
        dev.log('Path: $host$path');
        dev.log('Method: $method');
        dev.log('StatusCode: ${statusCode ?? '-'}');
        dev.log('Payload:\n$prettyprint');
        break;
      case RequestType.ERROR:
        dev.log('', error: '--------------------[ERROR]--------------------');
        dev.log('', error: 'Path: $host$path');
        dev.log('', error: 'Method: $method');
        dev.log('', error: 'StatusCode: $statusCode');
        dev.log('', error: 'Payload:$prettyprint');
        break;
    }
  }
}
