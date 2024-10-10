import 'dart:io';

import 'package:dio/dio.dart';

class PromptRepos {
  static Future<File?> generateImage(String prompt) async {
    String url = 'https://api.vyro.ai/v1/imagine/api/generations';
    Map<String, dynamic> headers = {
      'Authorization':
          'Bearer vk-0Fw7AauebCRvF1TuPOtdj523xlSED6DzbH6gFvDZFCsr2T3'
    };

    Map<String, dynamic> payload = {
      'prompt': prompt,
      'style_id': '29',
      'aspect_ratio': '4:3',
      'cfg': '1',
      'seed': '1',
      'high_res_results': '1',
    };

    Dio dio = Dio();
    dio.options = BaseOptions(
      headers: headers,
    );

    final response = await dio.post(url, data: payload);
    if (response.statusCode == 200) {
      File file = File("image.jpg");
      file.writeAsBytesSync(response.data);
      return file;
    } else {
      return null;
    }
  }
}
