
import 'dart:convert';

import 'package:noppal_util/repository/local_repo_item.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NplLocalReposiroty{

  final String espace;
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  NplLocalReposiroty(this.espace);

  Future<T> get<T>(LocalRepoItem<T> item) async {
    T? ob=item.get((await prefs),espace) ;
    if(ob==null){
      throw NplTreatRequestException(NplTreatRequestException.NO_DATA);
    }
    return ob;
  }
  void set<T>(LocalRepoItem<T> item,T value) async {
    item.set(await prefs, espace, value);
  }
  void remove(LocalRepoItem item) async{
    (await prefs).remove(item.key);
  }
  Future<void> cleanAll()async{
   (await prefs).clear() ;
  }
 

}
