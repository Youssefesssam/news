
import 'articales.dart'; // Import the correct class for articles

class ArticalesResponse {
  String? status;
  int? totalResults;
  List<Article>? articles; // Use the correct type here
  String? code;
  String? message;

  ArticalesResponse({this.status, this.totalResults, this.articles, this.message, this.code});

  ArticalesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    message = json['message'];
    code = json['code'];
    if (json['articles'] != null) {
      articles = <Article>[]; // Use the correct type here
      json['articles'].forEach((v) {
        articles!.add(Article.fromJson(v)); // Use the correct type here
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}