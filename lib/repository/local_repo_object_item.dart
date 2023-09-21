

import 'dart:convert';

import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoObjectItem<T> extends LocalRepoItem<T>{
  T Function(Map<String,dynamic>) create;
  Map<String,dynamic>  Function(T?) ?  toJson;
  LocalRepoObjectItem({required String key, required this.create,this.toJson}) : super(key);

  @override
  T? get(SharedPreferences prefs, String espace) {
    print('local----------- ${absoluteKey(espace)}');
    String? json=prefs.getString(absoluteKey(espace));
    print(json);
    if(json!=null)
      return create(jsonDecode(json));
    return null;
  }

  @override
  set(SharedPreferences prefs, String espace, T? value) {
    prefs.setString(absoluteKey(espace),jsonEncode((toJson==null) ? value : toJson!(value) ));
  }

}
