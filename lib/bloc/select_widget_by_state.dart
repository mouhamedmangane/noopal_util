
import 'package:flutter/material.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';

class SelectWidgetByState{
  static Widget select(EnumLoadableState state,Map<EnumLoadableState,Widget> map, {Widget? parDefaut})
  {
      if(map.containsKey(state)){
        return map[state]!;
      }
      return parDefaut!;
  }

  static Widget selectByBloc<T>(T state,List<SelectByStateLine> liste, {Widget? parDefaut})
  {
    for(SelectByStateLine sel in liste){
      if(sel.isType(state)){
        return sel.go(state);
      }
    }
    return parDefaut??Container();
  }
}

class SelectByStateLine<T>{
  final Widget Function(T) fonction;
  const SelectByStateLine(this.fonction);
  bool isType(dynamic d){
    return d is T;
  }
  Widget go(dynamic d){
    return fonction(d as T);
  }
}