import 'package:dio/dio.dart';
import 'package:pixabay_app/Constants/PixaBayConstants.dart';

Future<List<dynamic>?> getImageService() async {
  Response response;
  Dio _dio = Dio();

  try {
    print('trying');
    response = await _dio.get(PixaBayConstants.baseUrl);
    print(response.statusCode);
    return response.data['hits'];
  } catch (e) {
    print('Error message = ' + e.toString());
  }
}
