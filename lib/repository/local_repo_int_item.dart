


import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoIntItem extends LocalRepoItem<int>{
  LocalRepoIntItem(String key) : super(key);

  @override
  int? get(SharedPreferences prefs, String espace) {
    return prefs.getInt(espace+key);
  }

  @override
  set(SharedPreferences prefs, String espace, int? value) {
    if(value!=null)
      prefs.setInt(absoluteKey(espace), value);
  }



}