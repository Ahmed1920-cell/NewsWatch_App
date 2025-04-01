import 'package:dartz/dartz.dart';
import 'package:news/features/home/data/data_source/HomeDataSource.dart';
import 'package:news/features/home/domain/entity/NewsEntity.dart';
import 'package:news/features/home/domain/repo/NewsRepo.dart';

class NewsRepoImp extends NewsRepo{
  BaseDataSource baseDataSource;
  NewsRepoImp({required this.baseDataSource});
  @override
  Future<Either<String, List<NewsEntity>>> get({required String category}) async {
    try{
      List<NewsEntity> data=await baseDataSource.GetNews(category: category);
      return Right(data);
    }catch(e){
      return Left(e.toString());
    }
  }

}