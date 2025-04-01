import 'package:dartz/dartz.dart';
import 'package:news/features/home/domain/entity/NewsEntity.dart';

abstract class NewsRepo{
  Future<Either<String,List<NewsEntity>>> get({required String category});
}