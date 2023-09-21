

import 'dart:convert';

import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepoDynamicItem<T> extends LocalRepoItem<T>{
  T Function(dynamic) create;
  dynamic  Function(T?) ?  toJson;
  LocalRepoDynamicItem({required String key, required this.create,this.toJson}) : super(key);

  @override
  T? get(SharedPreferences prefs, String espace) {
    String? json=prefs.getString(absoluteKey(espace));
    if(json!=null)
      return create(jsonDecode(json));
    return null;
  }

  @override
  set(SharedPreferences prefs, String espace, T? value) {
    prefs.setString(absoluteKey(espace),jsonEncode((toJson==null) ? value : toJson!(value) ));
  }

}