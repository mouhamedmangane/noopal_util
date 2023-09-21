



import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:noppal_util/conf/env.dart';
import 'package:noppal_util/repository/server_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DisRepo{
  static String _globalToken="";
  static ServerModel serverModel=ServerModel(host: '',);

  String? tokenLocal;
  String? hostLocal;
  int? portLocal;
  String? protocoleLocal;

  DisRepo();

  String get token =>tokenLocal??_globalToken;
  String get host=> hostLocal?? serverModel.host;
  int get port=> portLocal ?? serverModel.port;
  String get protocole=> protocoleLocal ?? serverModel.protocole;

  static void setGlobalConnexionByConf(String entre){
    Map<String,dynamic> map=MyConf.getValue<Map<String,dynamic>>(entre);
    serverModel=ServerModel.fromJson(map);
  }

  static void setGlobalToken(String ? globalToken){
    _globalToken= globalToken??_globalToken;
  }

  static Future<void> readGlobalToken({String key = 'token'}) async{
    _globalToken=(await SharedPreferences.getInstance()).getString(key)??"";
  }

  static String getGlobalUrl(String path){
    return "${serverModel.protocole}://${serverModel.host}:${serverModel.port}/${path}";
  }

  Map<String,String> headers({bool needToken = false}){
    Map<String,String> map={
      'Content-Type':'application/json; charset=UTF-8',
    };
    if(needToken){
      print("with token${token}");

      map['Authorization']='Bearer '+token;
    }
    return map;
  }

  Future<T> getRequestAbsPath<T>(String url,T Function(String) onThen,{bool needToken = true}) async {
    print(url);
    return loadDataWith(http.get(Uri.parse(url),
        headers: headers(needToken: needToken)
    ).timeout(Duration(seconds:45)), onThen);
  }

  Future<T> deleteRequestAbsPath<T>(String url,T Function(String) onThen,{bool needToken = true}) async {
    print(url);
    return loadDataWith(http.delete(Uri.parse(url),
        headers: headers(needToken: needToken)
    ).timeout(Duration(seconds:45)), onThen);
  }

  Future<T> postRequestAbsPath<T>(String url,Map<String,dynamic>  body, T Function(String) onThen,{bool needToken = true}) async {
    print(url);
    return loadDataWith(http.post(Uri.parse(url),
        headers: headers(needToken: needToken),
        body: jsonEncode(body),

    ).timeout(Duration(seconds:45)), onThen);
  }

  Future<T> putRequestAbsPath<T>(String url,Map<String,dynamic>  body, T Function(String) onThen,{bool needToken = true}) async {
    print(url);
    return loadDataWith(http.put(Uri.parse(url),
      headers: headers(needToken: needToken),
      body: jsonEncode(body),

    ).timeout(Duration(seconds:45)), onThen);
  }

  Future<T> postMultiPartRequestAbsPath<T>(String url, T Function(String) onThen,{bool needToken = true,Map<String,String> ? fields,Map<String,String> ? files}) async {
    print(url);
    http.MultipartRequest request=http.MultipartRequest("POST",
      Uri.parse(url),
    );
    if(fields!=null){
      request.fields.addAll(fields!);
    }
    if(files!=null){
      for(String key in files.keys) {
        request.files.add(await http.MultipartFile.fromPath(
            key,
            files[key]!,
        )
        );
      }
    }

    request.headers.addAll(headers(needToken: needToken));

    return loadDataMultiPartWith(request.send(), onThen);
  }

  String urlWithPath(String path){
    return "${protocole}://${host}:${port}/${path}";
  }

  Future<T> postRequest<T>(String path,Map<String,dynamic>  body, T Function(String) onThen,{bool needToken = true}) async {
    String url=urlWithPath(path);
    return postRequestAbsPath<T>(url,body,onThen,needToken: needToken);
  }

  Future<T> putRequest<T>(String path,Map<String,dynamic>  body, T Function(String) onThen,{bool needToken = true}) async {
    String url=urlWithPath(path);
    return putRequestAbsPath<T>(url,body,onThen,needToken: needToken);
  }

  Future<T> postMultiPartRequest<T>(String path, T Function(String) onThen,{bool needToken = true,Map<String,String> ? fields,Map<String,String> ? files}) async {
    String url=urlWithPath(path);
    return postMultiPartRequestAbsPath<T>(url,onThen,needToken: needToken,files: files,fields: fields);
  }


  Future<T> getRequest<T>(String path, T Function(String) onThen,{bool needToken = true}) async {
    String url=urlWithPath(path);
    return getRequestAbsPath(url,onThen,needToken: needToken);
  }

  Future<T> deleteRequest<T>(String path, T Function(String) onThen,{bool needToken = true}) async {
    String url=urlWithPath(path);
    return deleteRequestAbsPath(url,onThen,needToken: needToken);
  }

  Future<T> loadDataWith<T>(Future<http.Response> futureResponse,T Function(String)onThen) async {
    print('------->Start Repo Distant :' );
    final response= await futureResponse;
    if(response.statusCode == 200) {
      print('\t le serveur a repondu ');
      print("\n${response.body}\n");
      return onThen(response.body);
    }
    else{
      print('------->Echec repo Distant :');
      throw Exception(response.statusCode.toString()+' '+response.body);
    }
  }

  Future<T> loadDataMultiPartWith<T>(Future<http.StreamedResponse> futureResponse,T Function(String)onThen) async {
    print('------->Start Repo Distant :' );
    final response= await futureResponse;
    String text=await response.stream.bytesToString();
    if(response.statusCode == 200) {
      print('\t le serveur a repondu ');
      print(text);
      return onThen(text);
    }
    else{
      print('------->Echec repo Distant :');
      throw Exception(response.statusCode.toString()+' '+text);
    }
  }






}