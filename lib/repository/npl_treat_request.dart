import 'dart:convert';

import 'package:noppal_util/dto/list_paginate.dart';
import 'package:noppal_util/repository/npl_treat_request_exception.dart';

import '../converter/npl_converter_object.dart';

class NplTreatRequest{
  static final String STATUT_KEY="statut";
  static final  String DATA_KEY="data";
  static final  String MESSAGE_KEY="message";
  static final  String ERREUR_KEY="erreurs";


  T _process<T>(String jsonString, T Function(dynamic) converter){
      Map<String,dynamic> map=jsonDecode(jsonString);
      if(map[STATUT_KEY]==true)
        return converter(map[DATA_KEY]);
      else
        throw NplTreatRequestException(map[MESSAGE_KEY],data: map[DATA_KEY],errors: map[ERREUR_KEY]);
   }
   
   T process<T>(String jsonString, T Function(dynamic) converter){
    	return _process(jsonString, converter);
   }

   T makeObject<T>(String jsonString,NplConverterObject<T> converterObject){
      return _process(jsonString, converterObject.converter );
   }

  T make<T>(String jsonString){
    return _process(jsonString, (p0) => p0 as T );
  }

  List<T> makeList<T>(String jsonString){
    return _process(jsonString, (p0) => p0.map<T>((e) => e as T).toList() );
  }
   List<T> makeListObject<T>(String jsonString,NplConverterObject<T> converterObject){
     return _process(jsonString, (p0) => p0.map<T>((e) => converterObject.converter(e)).toList() );
   }

   ListPaginate<T> makeListPaginationObject<T>(String jsonString,NplConverterObject<T> converterObject,
       {String ? dataKey='data',String maxPaginateKey="last_page",
        String currentPaginateKey="current_page",String totalKey="total",
         String avecKey="avec"
       }){
     if(dataKey==null) dataKey=DATA_KEY;
     Map<String,dynamic> map=jsonDecode(jsonString);
     print(map[DATA_KEY][dataKey]);

     if(map[STATUT_KEY]==true)
       return ListPaginate<T>(
           data: map[DATA_KEY][dataKey].map<T>((e) => converterObject.converter(e)).toList(),
           lastPage: map[DATA_KEY][maxPaginateKey],
           currentPage: map[DATA_KEY][currentPaginateKey],
           total: map[DATA_KEY][totalKey],
           avec: map[DATA_KEY][avecKey] ?? {},
       );
     else
       throw NplTreatRequestException(map[MESSAGE_KEY],data: map[DATA_KEY],errors: map[ERREUR_KEY]);
   }


}
