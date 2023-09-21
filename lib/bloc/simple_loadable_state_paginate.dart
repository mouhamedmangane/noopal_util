


import 'package:equatable/equatable.dart';
import 'package:noppal_util/bloc/enum_loadable_paginate_state.dart';
import 'package:noppal_util/dto/list_paginate.dart';

class SimpleLoadableStatePaginate<T> extends Equatable{
  ListPaginate<T>  value;
  EnumLoadablePaginateState state;
  String ? message;
  String ? param;
  int totalInsert;


  SimpleLoadableStatePaginate({
      ListPaginate<T> ? value,
      EnumLoadablePaginateState ? state,
      String ? message,
    String ? param,
    int ? totalInsert,

  }):
  value = value ?? ListPaginate(),
  state=state ?? EnumLoadablePaginateState.INIT,
  message=message,
  param=param,
  totalInsert= totalInsert ?? 0
  ;

  SimpleLoadableStatePaginate<T> copyWith({
      ListPaginate<T> ? value,
      EnumLoadablePaginateState ? state,
      String ? message,
      String ? param,
      int ? totalInsert,
    }
  ) => SimpleLoadableStatePaginate(
      value: value ?? this.value,
      state: state ?? this.state,
      message: message ?? this.message,
      param: param ?? this.param,
      totalInsert:  totalInsert ?? this.totalInsert,
  );

  SimpleLoadableStatePaginate<T> loading({String? message})=>copyWith(state: EnumLoadablePaginateState.LOADING, message: message);
  SimpleLoadableStatePaginate<T> loadingAdd({String? message})=>copyWith(state: EnumLoadablePaginateState.LOADING_ADD, message: message);
  SimpleLoadableStatePaginate<T> error(String  ?message)=>copyWith(state: EnumLoadablePaginateState.ERROR, message: message);
  SimpleLoadableStatePaginate<T> errorAdd(String? message)=>copyWith(state: EnumLoadablePaginateState.ERROR_ADD, message: message);

  SimpleLoadableStatePaginate<T> done(ListPaginate<T> data, {String ? param}){
    value.addPage(data);
    value.avec=data.avec;
    return copyWith(state: EnumLoadablePaginateState.DONE,message: message,param: param,);
  }

  SimpleLoadableStatePaginate<T> insertInFirst(T add){
    value.insertFirst(add);
    int total=totalInsert +1;
    return copyWith(state: EnumLoadablePaginateState.DONE,totalInsert: total);
  }

  bool isLimit(){
    return value.isLimit();
  }

  clear(){
    totalInsert=0;
    value.clear();
    param=null;
  }

  int total(){
    return (value.total>0)?value.total + totalInsert:0;
  }

  SimpleLoadableStatePaginate<T> delete(T element){
    List<T> listt =List.of(value.data);
    listt.remove(element);
    int tot = value.total - 1;
    return copyWith(value: value.copyWith(data: listt ,total: tot));
  }

  SimpleLoadableStatePaginate<T> put(index,T element){
    List<T> listt =List.of(value.data);
    listt[index]=element;
    return copyWith(value: value.copyWith(data: listt) );
  }

  SimpleLoadableStatePaginate<T> set(T old,T nouveau){
    List<T> listt =List.of(value.data);
    int index=value.data.indexOf(old);
    listt[index]=nouveau;
    return copyWith(value: value.copyWith(data: listt) );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [value,state,message,totalInsert,param];

}