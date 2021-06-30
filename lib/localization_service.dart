import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'lang/en_US.dart';
import 'lang/ar_EG.dart';
import 'lang/hi_IN.dart';
class LocalizationService extends Translations{
  static final locale = Locale('en','US');
  static final fallBackLocal=Locale('en','US');
  static final langs=['English','Hindi','Arabic'];
  static final locales=[
    Locale('en','US'),
    Locale('hi','IN'),
    Locale('ar','EG'),

  ];
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en':enUS,
    'hi':hiIn,
    'ar':arEG,
  };
  void changeLocate(String lang){
    final locale =getLocateFromLanguge(lang);
    final box=GetStorage();
    box.write('lng',lang);
    Get.updateLocale(locale!);
  }
  Locale? getLocateFromLanguge(String lang){
    for(int i=0;i<langs.length;i++){
      if(lang==langs[i]) return locales[i];
    }
    return Get.locale;
  }
  Locale getCrrentLocate(){
    final box =GetStorage();
    Locale defaultLocate;
    if(box.read('lng')!= null){
      final locale1=getLocateFromLanguge(box.read('lng'));
      defaultLocate=locale1!;
    }else{
      defaultLocate=Locale('en','US');
    }
    return defaultLocate;
  }
  String getCreentLang(){
    final box=GetStorage();
    return box.read('lng')!= null? box.read('lng'):'English';
  }


}
