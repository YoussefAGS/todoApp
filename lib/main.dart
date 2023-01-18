import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/stayls/my_themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routName,
      routes:{
        HomeLayout.routName :(context)=>HomeLayout(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTHemeData.lightTheme,
      darkTheme: MyTHemeData.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

