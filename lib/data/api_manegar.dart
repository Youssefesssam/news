import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/SourcesResponse.dart';

abstract class ApiManager {
  static Future<SourcesResponse> loadList() async {
    try {
      Uri url = Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?apiKey=94d147a0e7734e98be809693fbbe55ad");
      Response response = await get(url);
      SourcesResponse sourcesResponse =
      SourcesResponse.fromJsonMap(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return sourcesResponse;
      } else {
        throw  sourcesResponse.message??'somthing went wrong please try again later';
      }
    } catch (e) {
      rethrow;
    }
  }
}
