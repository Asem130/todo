import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'package:todo_app/shared/componantes.dart';

import 'package:todo_app/modules/archieved_tasks/archievedtasks_screen.dart';
import 'package:todo_app/modules/done_tasks/donetasks_screen.dart';
import 'package:todo_app/modules/new_tasks/newtasks_screen.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

import '../../shared/constance.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  late var titleController = TextEditingController();
  late var timeController = TextEditingController();
  late var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..creatDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is InsertIntoDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.cyan[500],
                child: Icon(cubit.fabIcon),
                onPressed: () {
                  if (cubit.isButtomSheetShwon) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertIntoDataBase(titleController.text,
                           timeController.text, dateController.text);
                    }
                  } else {
                    scaffoldKey.currentState!
                        .showBottomSheet((context) => Container(
                              padding: EdgeInsets.all(20.0),
                              color: Colors.grey[100],
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                        controller: titleController,
                                        decoration: InputDecoration(
                                          labelText: 'Task Title',
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.title),
                                        ),
                                        keyboardType: TextInputType.text,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'title must not be empty';
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          print(' title tapping');
                                        }),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                        controller: timeController,
                                        decoration: InputDecoration(
                                          labelText: 'Task Time',
                                          border: OutlineInputBorder(),
                                          prefixIcon:
                                              Icon(Icons.watch_later_outlined),
                                        ),
                                        keyboardType: TextInputType.datetime,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'time must not be empty';
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((value) {
                                            timeController.text = value!
                                                .format(context)
                                                .toString();
                                            print(value.format(context));
                                          });
                                        }),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                        controller: dateController,
                                        decoration: InputDecoration(
                                          labelText: 'Task date',
                                          border: OutlineInputBorder(),
                                          prefixIcon:
                                              Icon(Icons.date_range_outlined),
                                        ),
                                        keyboardType: TextInputType.datetime,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'date must not be empty';
                                          }
                                          return null;
                                        },
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.parse(
                                                  '2022-12-10'))
                                              .then((value) {
                                            dateController.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          });
                                        }),
                                  ],
                                ),
                              ),
                            ))
                        .closed
                        .then((value) {
                      cubit.changButtomSheetState(
                          isShow: false, icon: Icons.edit);
                    });
                    cubit.changButtomSheetState(isShow: true, icon: Icons.add);
                  }
                }),
            appBar: AppBar(
               backgroundColor: Colors.cyan[500],
          title: Text(
                AppCubit.get(context)
                    .titels[AppCubit.get(context).currentIndex],
                style: TextStyle(),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                cubit.changeindex(index);
              },
              items: [
                BottomNavigationBarItem(
                  label: 'New Tasks',
                  icon: Icon(Icons.menu),
                ),
                BottomNavigationBarItem(
                  label: 'Done Tasks',
                  icon: Icon(Icons.checklist_rtl_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Archieved Tasks',
                  icon: Icon(Icons.archive_outlined),
                )
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! GeLoadingDatabaseState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}/*  defualtTextForm(
                                          controller: dateController,
                                          label: 'Task date',
                                          inputType: TextInputType.datetime,
                                          validation: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'date must not be empty';
                                            }
                                            return null;
                                          },
                                          prefix: Icons.date_range_outlined,
                                          onTap: () {
                                            showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime.now(),
                                                    lastDate: DateTime.parse(
                                                        '2022-10-10))
                                                .then((value) {
                                              dateController.text =
                                                  DateFormat.yMMMd()
                                                      .format(value!);
                                            });
                                          }),*/