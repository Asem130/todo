import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/componantes.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class DoneTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,Appstate){} ,
      builder: (context,Appstate){
        var tasks =AppCubit.get(context).doneTasks;

        return builderTask(
          tasks: tasks
        );
      },


    );
  }
}
