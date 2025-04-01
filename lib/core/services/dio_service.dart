import 'package:dio/dio.dart';


class DioService{
  Dio dio;
  String url;
  String apiKey;
  DioService({required this.dio, required this.apiKey,required this.url});
  Future <List> getNews({required String category}) async{
    print("done");
    var response=await dio.get(url,
        queryParameters: {
          "country":"us",
          "apiKey":apiKey,
          "category":category
        }
    );
    List arcticales=response.data["articles"];
    return arcticales;
  }
}