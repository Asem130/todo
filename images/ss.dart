//  MaterialApp
//             (
//             themeMode:AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
//             darkTheme: ThemeData(
//               scaffoldBackgroundColor: HexColor('333739'),
//               primarySwatch: Colors.deepOrange,
//               appBarTheme: AppBarTheme(
//                 backwardsCompatibility: false,
//                 elevation: 0.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                   systemNavigationBarIconBrightness: Brightness.dark,
//                   statusBarColor: HexColor('333739'),
//                   statusBarIconBrightness: Brightness.light,
//                 ),
//                 titleTextStyle: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//                 iconTheme: IconThemeData(color: Colors.white),
//                 color: HexColor('333739'),
//               ),
//               bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                   elevation: 20.0,
//                   backgroundColor: HexColor('333739'),
//                   unselectedItemColor: Colors.grey,
//                   selectedItemColor: Colors.deepOrange,
//                   type: BottomNavigationBarType.fixed),
//               textTheme: TextTheme(bodyText1: TextStyle(
//                 fontSize: 18.0,fontWeight: FontWeight.w600,
//                 color: Colors.white,
//               )),
//             ),
//             home: NewsHomeLayout(),
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               textTheme: TextTheme(bodyText1: TextStyle(
//                 fontSize: 18.0,fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//               )),
//               primarySwatch: Colors.deepOrange,
//               floatingActionButtonTheme:
//               FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
//               scaffoldBackgroundColor: Colors.white,
//               appBarTheme: AppBarTheme(
//                 backwardsCompatibility: false,
//                 elevation: 0.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                   statusBarColor: Colors.white,
//                   statusBarIconBrightness: Brightness.dark,
//                 ),
//                 titleTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//                 iconTheme: IconThemeData(color: Colors.black),
//                 color: Colors.white,
//               ),
//               bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                   elevation: 20.0,
//                   backgroundColor: Colors.white,
//                   selectedItemColor: Colors.deepOrange,
//                   unselectedItemColor: Colors.grey,
//                   type: BottomNavigationBarType.fixed),
//             ),
//           );