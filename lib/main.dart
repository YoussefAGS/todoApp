import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/layout/prefrancese.dart';
import 'package:todo/moudlse/Update/update_task.dart';
import 'package:todo/provider/my_provider.dart';
import 'package:todo/shared/stayls/my_themedata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await prefHandlar.init();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => MyProvider()..fetchmode()),
        ],
        child: EasyLocalization(
            startLocale: Locale("en"),
            saveLocale: true,
            supportedLocales: [Locale("en"), Locale("ar", "EG")],
            fallbackLocale: Locale('en'),
            path: 'assets/translations',
            child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  late MyProvider provider;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: HomeLayout.routName,
      routes: {
        HomeLayout.routName: (context) => HomeLayout(),
        Update.routname: (context) => Update(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTHemeData.lightTheme,
      darkTheme: MyTHemeData.darkTheme,
      themeMode: provider.currentTheme,
    );
  }
}
