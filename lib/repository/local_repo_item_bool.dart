


import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoItemBool extends LocalRepoItem<bool>{
  LocalRepoItemBool(String key) : super(key);

  @override
  bool? get(SharedPreferences prefs, String espace) {
    return prefs.getBool(espace+key);
  }

  @override
  set(SharedPreferences prefs, String espace, bool? value) {
    if(value!=null)
      prefs.setBool(absoluteKey(espace), value);
  }



}