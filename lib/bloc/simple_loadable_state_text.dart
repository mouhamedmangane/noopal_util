


import 'package:noppal_util/bloc/enum_loadable_state.dart';
import 'package:noppal_util/bloc/simple_loadable_state.dart';

class SimpleLoadableStateText<T> extends SimpleLoadableState<T>{
  String ? text;
  SimpleLoadableStateText({
    T? value,
    required EnumLoadableState state,
    required String message,
    this.text
  }) : super(
    value: value,state: state,message: message
  );

  SimpleLoadableStateText.error(String message):
       super.error(message)
  ;
  SimpleLoadableStateText.init({String? message}):
        super.init(message: message)
  ;
  SimpleLoadableStateText.done(T value,{String? message}):
    super.done(value,message:message)
  ;
  SimpleLoadableStateText.loading({String? message}):
        super.loading(message:message)
  ;

}