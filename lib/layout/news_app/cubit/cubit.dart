import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';

import '../../../modules/business_screen/business_screen.dart';
import '../../../modules/science_screen/science_screen.dart';
import '../../../modules/settings_screen/settings_screen.dart';
import '../../../modules/sports_screen/sports_screen.dart';
import '../../../shared/network/remote/diohelper.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInistioalState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
    Settings(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_volleyball_rounded),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  void changeBottomNavBar(index)
  {
    currentIndex=index;
    if (index == 1)

        getSport();
    if(index == 2) getScience();

    emit(NewsBottomNavBarState());
  }
  List<dynamic>business=[];
  void getBusiness()
  {
        emit(NewsGetBusinessLodingState());
    DioHelper.getData(url: '/v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apiKey':'6e1a2d469d044c86bb8aa985f0b63c4c',

        }
    ).then((value)
    {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccssState());

    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }
  List<dynamic>sports=[];
  void getSport()
  {
    if (sports.length==0)
      {
        emit(NewsGetBusinessLodingState());
        DioHelper.getData(url: '/v2/top-headlines',
            query: {
              'country':'eg',
              'category':'sports',
              'apiKey':'6e1a2d469d044c86bb8aa985f0b63c4c',

            }
        ).then((value)
        {
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(NewsGetSportsSuccssState());

        }).catchError((error){
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });

      }
    else {
      emit(NewsGetSportsSuccssState());

    }

  }
  List<dynamic>science=[];
  void getScience()
  {
    if (science.length==0)
      {
        emit(NewsGetScienceLodingState());
        DioHelper.getData(url: '/v2/top-headlines',
            query: {
              'country':'eg',
              'category':'science',
              'apiKey':'6e1a2d469d044c86bb8aa985f0b63c4c',

            }
        ).then((value)
        {
          science = value.data['articles'];
          print(science[0]['title']);
          emit(NewsGetScienceSuccssState());

        }).catchError((error){
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }
    else
    {
      emit(NewsGetScienceSuccssState());
    }

  }

}
