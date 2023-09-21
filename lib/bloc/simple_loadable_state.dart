


import 'package:equatable/equatable.dart';
import 'package:noppal_util/bloc/enum_loadable_state.dart';

class SimpleLoadableState<T> extends Equatable{
  final T ? value;
  final EnumLoadableState state;
  final String ? message;

  const SimpleLoadableState({
       this.value,
       this.state=EnumLoadableState.INIT,
      this.message
  });

  const SimpleLoadableState.error(String this.message, {this.value}):
    state=EnumLoadableState.ERROR
  ;
  const SimpleLoadableState.init({this.value,this.message}):
      state=EnumLoadableState.INIT
  ;
  const SimpleLoadableState.done(T this.value,{this.message}):
        state=EnumLoadableState.DONE
  ;
  const SimpleLoadableState.loading( {this.value,this.message}):
        state=EnumLoadableState.LOADING
  ;

  @override
  List<Object?> get props => [value,state,message];

}