import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:news/features/home/domain/entity/NewsEntity.dart';
import 'package:news/features/home/domain/usecase/GetNews_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  String ArticalType="general";
  GetNewsUseCase getNewsUseCase;
  NewsBloc({required this.getNewsUseCase}) : super(NewsInitial()) {
    on<GetNews>(_GetNews);
  }
  Future<void> _GetNews(GetNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    EasyLoading.show(status: 'loading...');
    final result = await getNewsUseCase.execute(category: ArticalType);
     await result.fold((failure) async {
       EasyLoading.instance
         ..backgroundColor = Colors.red
         ..textColor = Colors.white
         ..indicatorColor = Colors.white;
       EasyLoading.showError(failure);
       await Future.delayed(const Duration(milliseconds: 1000));
       EasyLoading.dismiss();
      emit(NewsError( error: failure));
    }, (data)  async {
       EasyLoading.dismiss();
       emit(NewsDone(data: data));
    });
  }

}
