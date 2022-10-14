import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/shared/cubit/states.dart';

import '../../modules/archieved_tasks/archievedtasks_screen.dart';
import '../../modules/done_tasks/donetasks_screen.dart';
import '../../modules/new_tasks/newtasks_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInistialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<String> titels = [
    'New Tasks',
    'Done Tasks',
    'Archieved Tasks',
  ];
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchievedTasks(),
  ];
  List<Map>newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archievedTasks = [];
  var currentIndex = 0;
  void changeindex(int index) {
    currentIndex = index;
    emit(AppButtomNavBarState());
  }

  late Database database;
  bool isButtomSheetShwon = false;
  IconData fabIcon = Icons.edit;
  void creatDataBase() {
    openDatabase(
      'todd13.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,time TEXT,date TEXT,status TEXT)')
            .then((value) {
          print('Tabale Created succssefuly');
        }).catchError((error) {
          print('Error when creating table${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(CreatDatabaseState());
    });
  }

  insertIntoDataBase(
    String ?title,
     String ?time,
       String ?date,
  ) async {
    await database.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(InsertIntoDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });


    });
  }


  void changButtomSheetState({required bool isShow, required IconData icon}) {
    isButtomSheetShwon = isShow;
    fabIcon = icon;
    emit(ChangButtomSheetState());
  }

  void updateDataBase({
    required String status,
    required int id,
  })async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',['$status',id]).then((value) {
      getDataFromDatabase(database);
      emit(UpdateDatabaseState());
    });
  }

  /*void deleteFromDataBase({
       required int id,
  })async {
    database.rawDelete('DELETE FEROM tasks WHERE id = ?',[id]).then((value) {
      getDataFromDatabase(database);
      emit(DeleteDatabaseState());
    });
  }*/
  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(DeleteDatabaseState());
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archievedTasks = [];

    emit(GeLoadingDatabaseState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archievedTasks.add(element);
      });

      emit(GetDataFromDatabaseState());
    });
  }
  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    emit(ChangeAppModState());
  }
}
