import 'dart:convert';
import 'package:http/http.dart';

import '../model/ArticalesResponse.dart';
import '../model/SourcesResponse.dart';


abstract class ApiManager {
  static const String defaultErrorMessage ="Something went please again later";
  static const String baseUrl = "https://newsapi.org";

  static Future<SourcesResponse> loadList(String categoryId) async {
    try {
      Uri url = Uri.parse(
          "$baseUrl/v2/top-headlines/sources?apiKey=94d147a0e7734e98be809693fbbe55ad");
      Response response = await get(url);
      SourcesResponse sourcesResponse =
      SourcesResponse.fromJsonMap(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return sourcesResponse;
      } else {
        throw  sourcesResponse.message??deprecated;
      }
    } catch (e) {
      rethrow;
    }
  }

   static Future<ArticalesResponse> loadArticlesList (String sourceId)async{
   try{
     Uri url =Uri.parse("$baseUrl/v2/everything?apiKey=94d147a0e7734e98be809693fbbe55ad&sources=$sourceId");
     Response apiResponse = await get(url);
     ArticalesResponse articlesResponse = ArticalesResponse.fromJson(jsonDecode(apiResponse.body));
     if(apiResponse.statusCode>=200 && apiResponse.statusCode<=300)
     {
       return articlesResponse;
     }else{
       throw articlesResponse.message??defaultErrorMessage;
     }
    }catch(e){
     rethrow ;
   }
   }
}
