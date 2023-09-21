

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NplPhoneTextInputFormatter extends TextInputFormatter{
  static List<int> _position=[2,6,9,12,15];
  final int maxLength;

  NplPhoneTextInputFormatter({required this.maxLength}):super();

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    //print('olf'+oldValue.text);
    print(newValue.text);
    if (newValue.text.length>0) {
      if(newValue.text.length > oldValue.text.length){
        if(_position.contains(newValue.text.length)){
          return makeSeparate(oldValue, newValue, newValue.text.length);
        }
      }
      else if(newValue.text.length == oldValue.text.length){
        return _decalerEspace(oldValue,newValue);
      }
      else{
        if(newValue.text[newValue.text.length -1] == ' '){
          return eliminerSeparateur(oldValue, newValue);
        }
      }
    }
    return newValue;
  }

  TextEditingValue makeSeparate(TextEditingValue oldValue, TextEditingValue newValue,int poisiton){
    return TextEditingValue(
        text:(newValue.text.length==maxLength) ? "${newValue.text}" : "${newValue.text} ",
        selection: TextSelection.collapsed(
            offset:(newValue.selection.end!=maxLength) ? newValue.selection.end+1 : newValue.selection.end,
        )
    );
  }

  TextEditingValue eliminerSeparateur(TextEditingValue oldValue, TextEditingValue newValue,){
    return TextEditingValue(
        text: newValue.text.substring(0,newValue.text.length-1),
        selection: TextSelection.collapsed(
          offset: newValue.selection.end- 1
        )
    );
  }

  TextEditingValue _decalerEspace(TextEditingValue oldValue, TextEditingValue newValue){
    int pos=newValue.selection.end;
    return TextEditingValue(
        text: newValue.text,
        selection: TextSelection.collapsed(
            offset: (pos > 0 && pos< newValue.text.length-1 && newValue.text[pos-1]== ' ')? newValue.selection.end-1 : newValue.selection.end,
        )
    );
  }
}