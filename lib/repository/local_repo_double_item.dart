



import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoDoubleItem extends LocalRepoItem<double>{
  LocalRepoDoubleItem(String key) : super(key);

  @override
  double? get(SharedPreferences prefs, String espace) {
    return prefs.getDouble(absoluteKey(espace));
  }

  @override
  set(SharedPreferences prefs, String espace, double? value) {
    if(value!=null)
      prefs.setDouble(absoluteKey(espace), value);
  }



}