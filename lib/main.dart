import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multlange/localization_service.dart';

import 'homePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(),
      locale: LocalizationService().getCrrentLocate(),
      fallbackLocale: Locale('en','US'),
      home: HomePage(),
    );
  }
}


