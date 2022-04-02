import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pixabay_app/Constants/PixaBayConstants.dart';
import 'package:pixabay_app/Models/ResponseModel.dart';

Future<List<dynamic>> getImageService() async {
  Response response;
  Dio _dio = Dio();

  try {
    print('trying');
    response = await _dio.get(PixaBayConstants.baseUrl);
    return response.data['hits'];
  } catch (e) {
    print('Error message = ' + e.toString());
    return <dynamic>[];
  }
}
