
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepo {
  static String _key="key_token_repo";
  static String _token='';

  static Future<String> initToken() async {
    _token=(await SharedPreferences.getInstance()).getString(_key)??'';
    return _token;

  }
  static String getToken()=>_token;

  static Future<void> setToken(String value) async {
    (await SharedPreferences.getInstance()).setString(_key, value);
  }
}