import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/routes/page_route_name.dart';
import '../../../../core/themes/color_palette.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../auth/presention/bloc/auth_bloc.dart';
import '../bloc/news_bloc.dart';
import 'NewsView.dart';


class NewsBody extends StatelessWidget {
   NewsBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColorPalette.white,
      appBar: AppBar(
        actions: [
          BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is AuthSignOut){
      Navigator.pushNamedAndRemoveUntil(context, PageRouteName.login, (route)=>false);
    }
  },
  child: IconButton(onPressed: (){
BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
          }, icon: Icon(Icons.logout,color: BaseColorPalette.Title_watch,)),
),
        ],
        backgroundColor: BaseColorPalette.white,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(text: "News", size: 21,color: BaseColorPalette.Title_news,fontWeight: FontWeight.bold,),
            TextWidget(text: "Watch", size: 23,color: BaseColorPalette.Title_watch,fontWeight: FontWeight.bold),
          ],
        ),
      ),
      body:BlocBuilder<NewsBloc, NewsState>(
  builder: (context, state) {
    if(state is NewsLoading){
      return TextWidget(text: '', size: 1);
    }
    else if(state is NewsDone){
      return NewsView(data: state.data,);
    }
    else{
      String error='';
      if(state is NewsError)
        error=state.error;
      return Center(
        child: Column(
          children: [
            TextWidget(text: error, size: 18, color: BaseColorPalette.black,),
            IconButton(onPressed: () {
              BlocProvider.of<NewsBloc>(context).add(GetNews());
            }, icon: Icon(Icons.refresh, color: BaseColorPalette.black,))
          ],
        ),
      );
    }
  },
),
    );
  }
}
