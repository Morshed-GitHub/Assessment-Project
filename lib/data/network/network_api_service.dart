import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../exceptions.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {
  final Dio dio = Dio();

  @override
  Future getGetApiResponse(String url, [Map<String, dynamic>? headers]) async {
    final dio = Dio();
    try {
      final response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      debugPrint(response.data.runtimeType.toString());
      debugPrint(response.runtimeType.toString());
      // debugPrint(response.data.toString());
      return returnResponse(response); // Process the response and return
    } on DioError catch (e) {
      throw Exception('Error Occurred: ${e.message}'); // Throw error warning
    }
  }

  // Process the Response and do operation's according to Response Status Code
  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;
      // return jsonDecode(response.data); // String [text/plain]
      case 400:
        throw BadRequestException(response.data['message']);
      case 404:
        throw UnauthorisedException(response.data['message']);
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code ${response.statusCode.toString()}');
    }
  }
}
