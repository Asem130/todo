import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/counter/cubit/cubit.dart';
import 'package:todo_app/modules/counter/cubit/states.dart';

class Counter extends StatelessWidget {
  @override
  int counter = 0;

  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: BlocConsumer <CounterCubit, CounterStates>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  title:
                  Text(
                    'Counter', style: TextStyle(fontWeight: FontWeight.bold),),
                  centerTitle: true,
                ),
                body: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        CounterCubit.get(context).plus();
                      },
                          child: Text('Plus', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),)),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: Text('${CounterCubit
                              .get(context)
                              .counter}',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 80),),
                        ),
                      ),
                      TextButton(onPressed: () {
                        CounterCubit.get(context).minus();
                      },
                          child: Text('Minus', style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),)),

                    ],
                  ),
                ),

              );
            }
        )

    );
  }

}