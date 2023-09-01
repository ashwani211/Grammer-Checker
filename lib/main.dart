import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grammarchecker/features/grammar/screen/grammar_check.dart';

import 'common/util/network/dependency_injection.dart';

Future<void> main() async {
  runApp(const MyApp());
  DependencyInjection.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)),
      // themeMode: isDarkTheme? ThemeMode.dark : ThemeMode.light,
      // darkTheme: ThemeData.dark(useMaterial3: true),
      home: const GrammarCheckerScreen(),
      // home: Page1(),
    );
  }
}

