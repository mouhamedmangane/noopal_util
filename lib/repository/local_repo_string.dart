import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoStringItem extends LocalRepoItem<String> {
  LocalRepoStringItem(String key) : super(key);

  @override
  String? get(SharedPreferences prefs, String espace) {
    return prefs.getString(absoluteKey(espace));
  }

  @override
  set(SharedPreferences prefs, String espace, String? value) {
    if (value != null)
      prefs.setString(absoluteKey(espace), value);
  }

}