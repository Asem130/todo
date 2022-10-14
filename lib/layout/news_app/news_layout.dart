import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/layout/news_app/cubit/cubit.dart';
import 'package:todo_app/layout/news_app/cubit/states.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/network/remote/diohelper.dart';

class NewsHomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
       listener: (context,state){},
        builder: (context,state){
         var cubit =NewsCubit.get(context);
         return Scaffold(
           appBar: (
               AppBar(
                 title: Text('News App'),
                 actions: [
                   IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                   IconButton(onPressed: (){
                     AppCubit.get(context).changeAppMode();
                   }, icon: Icon(Icons.brightness_6_rounded))
                 ],

               )
           ),
           bottomNavigationBar:BottomNavigationBar(
             items:
               cubit.bottomItems,
             currentIndex: cubit.currentIndex,
             onTap: (index)
               {
                 cubit.changeBottomNavBar(index);
               }

           ),
           body: cubit.screens[cubit.currentIndex],
         );
        },
      ),
    );
  }
}
