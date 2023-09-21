

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalRepoItem<T>{
  final String key;
  const LocalRepoItem(this.key);

  String absoluteKey(String espace){
    return espace+key;
  }

  T? get(SharedPreferences prefs,String key,);

  set(SharedPreferences prefs,String espace,T value);
}