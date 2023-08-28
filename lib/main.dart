import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grammarlyclone/features/grammar/screen/grammar_check.dart';

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
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: GrammarCheckerScreen(),
      // home: Page1(),
    );
  }
}

