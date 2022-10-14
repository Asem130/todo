import 'package:todo_app/shared/cubit/cubit.dart';

abstract class AppStates {}

class AppInistialState extends AppStates {}

class AppButtomNavBarState extends AppStates {}

class CreatDatabaseState extends AppStates {}

class InsertIntoDatabaseState extends AppStates {}

class UpdateDatabaseState extends AppStates {}

class GetDataFromDatabaseState extends AppStates {}

class GeLoadingDatabaseState extends AppStates {}

class ChangButtomSheetState extends AppStates {}
class DeleteDatabaseState extends AppStates {}
class ChangeAppModState extends AppStates {}
