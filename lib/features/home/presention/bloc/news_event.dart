part of 'news_bloc.dart';


sealed class NewsEvent {}

class GetNews extends NewsEvent{
  GetNews();
}

