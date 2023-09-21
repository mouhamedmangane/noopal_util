import 'dart:math';

import 'package:noppal_util/model/gen_data.dart';

abstract class GenDataArrayImpl<T> extends GenData<T>{
  int position=0;
  List<T> getData();

  T getCurrent(){
    return getData()[position];
  }

  T next(){
    if(position>=length()-1){
      position=0;
    }
    else{
      position++;
    }
    return getData()[position];
  }

  int length(){
    return getData().length;
  }

  T random(){
    int position=Random(DateTime.now().microsecondsSinceEpoch).nextInt(getData().length);
    return getData()[position];
  }

}