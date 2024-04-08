import 'package:news/model/sources.dart';

class SourcesResponse {

  String? status;
  List<Source>? sources;
	String? code;
	String? message;

	SourcesResponse({
		required this.sources,
		this.status,
		this.message,
		this.code,

});

	SourcesResponse.fromJsonMap( dynamic jason):
		status = jason["status"],
	  message = jason["message"],
		code =jason["code"],
	  sources = List<Source>.from(jason["sources"].map((it) =>
				Source.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['status'] = status;
		data['sources'] = sources != null ?
			this.sources?.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
