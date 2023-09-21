import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoListStringItem extends LocalRepoItem<List<String>> {
  LocalRepoListStringItem(String key) : super(key);

  @override
  List<String>? get(SharedPreferences prefs, String espace) {
    return prefs.getStringList(absoluteKey(espace));
  }

  @override
  set(SharedPreferences prefs, String espace, List<String>? value) {
    if (value != null)
      prefs.setStringList(absoluteKey(espace), value);
  }
}