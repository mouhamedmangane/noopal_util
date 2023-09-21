

import 'dart:convert';

import 'package:flutter/services.dart';

part 'user_const_conf.dart';

class MyConf{
  static Map<String,dynamic> values={};
  static List<String> loaded=[];
  static Future<void> loadFilFromJson(String file) async{
    if(!loaded.contains(file+'json')){
      String brute_text_conf= await rootBundle.loadString(file);
      Map<String,dynamic> map= jsonDecode(brute_text_conf);
      values.addAll(map);
    }
  }

  static addVariable(String key,dynamic value){
    values[key]=value;
  }

  static String getString(String key){
    return values[key] as String;
  }
  static num getNum(String key){
    return values[key] as num;
  }
  static T getValue<T>(String key){
    return values[key] as T;
  }
}