import 'package:dio/dio.dart';
import 'dart:async';

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    response = await dio.post(url, data: formData);
    // 成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常。。');
    }
  }catch (e) {
    return print('error:::${e}');
  }
}