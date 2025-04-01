import 'package:news/features/home/domain/repo/NewsRepo.dart';

class GetNewsUseCase{
  NewsRepo newsRepo;
  GetNewsUseCase({required this.newsRepo});
  Future execute({required String category})async{
    return await newsRepo.get(category: category);
  }
}