
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/widets/app_loader.dart';
import '../../../../data/api_manegar.dart';
import '../../../../model/articales.dart';
import '../../../widets/app_error.dart';


class TabDetails extends StatelessWidget {
 final String sourceId;

 const TabDetails({Key? key, required this.sourceId}) : super(key: key);

 @override
 Widget build(BuildContext context) {
  return FutureBuilder(
   future: ApiManager.loadArticlesList(sourceId),
   builder: (context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
     return AppError(error: snapshot.error.toString());
    } else if (snapshot.hasData) {
     return articlesList(snapshot.data.articles);
    } else {
     return const AppLaoder();
    }
   },
  );
 }

 Widget articlesList(List<Article>? articles) {
return ListView.builder(
      itemCount: articles?.length,
    itemBuilder: (context,index){
       return articleWidget(context,articles![index]);
    });
 }
 Widget articleWidget(BuildContext context,Article article) {
  return Column(
   children: [
    CachedNetworkImage(
        imageUrl: article.urlToImage!,
     height: MediaQuery.of(context).size.height*.25,
     errorWidget:(_,__,___)=> const Center(child:Icon(Icons.error,color: Colors.red,size: 60,))  ,
     placeholder:(_,__,)=> const AppLaoder(),

    ),
    Text(article.source?.name??'',textAlign:TextAlign.left ),
    Text(article.title??'',textAlign:TextAlign.start),
    Text(article.publishedAt??'',textAlign:TextAlign.end),
   ],
  );
 }
}
