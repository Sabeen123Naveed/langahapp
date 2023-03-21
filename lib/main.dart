import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import 'Login/emailverfication.dart';
import 'Login/loginpage.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

// Ideal time to initialize
  runApp(
      EasyLocalization(
          supportedLocales: [
            Locale('tr', 'TR'),
            Locale('en', 'US'),
            Locale('ur', 'PK'),
            Locale('hi', 'IN')
          ],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en', 'US'),
          child: MyApp()
      )
      );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home:   Login()
    );
  }
}

