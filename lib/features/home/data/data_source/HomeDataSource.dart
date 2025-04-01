import 'package:news/features/home/data/dto/NewsModel.dart';

import '../../../../core/services/dio_service.dart';

abstract class BaseDataSource{
  Future<List<NewsModel>> GetNews({required String category});
}
class HomeDataSource extends BaseDataSource{
  DioService dioService;
  HomeDataSource({required this.dioService});
  @override
  Future<List<NewsModel>> GetNews({required String category})async {
    List response=await dioService.getNews(category: category);
    return response.map((element) => NewsModel.fromMap(element)).toList();
  }

}