import 'package:news/features/home/domain/entity/NewsEntity.dart';

class NewsModel extends NewsEntity{
  NewsModel({required super.ImageUrl, required super.title, required super.description});

  factory NewsModel.fromMap(Map<String,dynamic> data){
    return NewsModel
      (ImageUrl: data['urlToImage'],
       title: data['title'],
       description: data['description']);
  }
}