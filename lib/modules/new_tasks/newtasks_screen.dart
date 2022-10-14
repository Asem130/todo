import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/shared/constance.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

import '../../shared/componantes.dart';

class NewTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
     listener:(context,Appstate){} ,
      builder: (context,Appstate){
       var tasks =AppCubit.get(context).newTasks;

       return
         builderTask(tasks: tasks);

      },


    );
  }
}
