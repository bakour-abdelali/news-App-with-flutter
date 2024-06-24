import 'package:app_news_api/rimot/dio_helper.dart';
import 'package:app_news_api/scrren/news_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'const/bloc_over.dart';
import 'cubit/conter_cube.dart';
import 'cubit/statesCounter.dart';
import 'modles/shared_prafrnce.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await ShaerdPrafrnce.initData();
  DigHelper.init();
  bool? isDark = await ShaerdPrafrnce.getData(key: 'isDark')!;

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp(
    this.isDark, {
    super.key,
  });

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // lazy: false,
      create: (context) => AppNwes()
        ..getSports()
        // ..getSearech('g')
        ..ChangeMode(from: this.isDark),
      child: BlocConsumer<AppNwes, States>(
        listener: (BuildContext context, States state) {},
        builder: ((context, state) {
          var list = AppNwes.get(context).getSearech;
          return MaterialApp(
            //debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: AppNwes.get(context).isDark == true
                ? ThemeMode.dark
                : ThemeMode.light, //AppNwes.get(context).isDark
            darkTheme: ThemeData(
              textTheme: const TextTheme(
                //subtitle1: Text,
                bodyLarge: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.green,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 11, 221, 18),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 11, 221, 18),
                elevation: 3000,
                unselectedItemColor: Colors.grey,
                backgroundColor: Color(0x00333739),
              ),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white, size: 30),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: Color(0x00333739), //333739
                  // Color.fromARGB(255, 65, 60, 60), // HexColor('1123'),
                  elevation: 0.0,
                  //color: Colors.black,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white)),
            ),
            theme: ThemeData(
              primarySwatch: Colors.green,
              scaffoldBackgroundColor: Colors.white,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color.fromARGB(255, 11, 221, 18),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Color.fromARGB(255, 11, 221, 18),
                elevation: 3000,
              ),
              appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black, size: 30),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 0.0,
                  color: Colors.white,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black)),
              //primarySwatch: Colors.blue,
              textTheme: const TextTheme(
                  //subtitle1: Text,
                  bodyLarge: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
            ),
            home: ScrrenNewsApp(),
          );
        }),
      ),
    );
  }
}
