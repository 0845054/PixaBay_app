import 'package:dio/dio.dart';
import 'package:pixabay_app/Constants/PixaBayConstants.dart';
import 'package:pixabay_app/Models/ResponseModel.dart';

Future<responseModel> getImageService() async {
  Response response;
  Dio _dio = Dio();

  try {
    response = await _dio.get(PixaBayConstants.baseUrl);
    return new responseModel(
        response.statusCode ?? -1, response.statusMessage ?? '', response.data);
  } catch (e) {
    print(e);
  }
  return new responseModel(-1, 'error', '');
}
