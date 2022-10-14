import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/layout/todo-app/home_layout.dart';
import 'package:todo_app/modules/counter/counter_screen.dart';
import 'package:todo_app/shared/bloc_observer.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';
import 'package:todo_app/shared/network/remote/diohelper.dart';

import 'layout/news_app/news_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state) {
          return  MaterialApp
            (
            themeMode:AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  systemNavigationBarIconBrightness: Brightness.dark,
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                iconTheme: IconThemeData(color: Colors.white),
                color: HexColor('333739'),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 20.0,
                  backgroundColor: HexColor('333739'),
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed),
              textTheme: TextTheme(bodyText1: TextStyle(
                fontSize: 18.0,fontWeight: FontWeight.w600,
                color: Colors.white,
              )),
            ),
            home: NewsHomeLayout(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(bodyText1: TextStyle(
                fontSize: 18.0,fontWeight: FontWeight.w600,
                color: Colors.black87,
              )),
              primarySwatch: Colors.deepOrange,
              floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                iconTheme: IconThemeData(color: Colors.black),
                color: Colors.white,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed),
            ),
          );
        }
      ),
    );
  }
}
