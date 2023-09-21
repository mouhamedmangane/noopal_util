import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:noppal_util/model/gen_data.dart';

abstract class GenDataImpl<T> extends GenData<T>{
  T ? current;

  T nextImpl();
  T randomImpl();

  @override
  T getCurrent() {
    // TODO: implement getCurrent
    if(current!=null){
      return current!;
    }
    else{
      return next();
    }
  }

  @override
  T next() {
    current=nextImpl();
    return current!;
  }

  @override
  T random() {
    current=randomImpl();
    return current!;
  }

}