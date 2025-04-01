part of 'news_bloc.dart';


sealed class NewsState {}

final class NewsInitial extends NewsState {}
final class NewsLoading extends NewsState {}
final class NewsDone extends NewsState {
  List<NewsEntity> data;
  NewsDone({required this.data});
}
final class NewsError extends NewsState {
  String error;
  NewsError({required this.error});
}
