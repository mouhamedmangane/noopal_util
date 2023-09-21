import 'package:flutter/services.dart';

class NplSeparatorTextEditing extends TextInputFormatter{
  final String separator;
  final int nombreCaractere;

  NplSeparatorTextEditing({this.separator=" ",this.nombreCaractere=3});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length>0){
      int offset=0;
      String text=format(newValue.text);
      print('n'+text.length.toString());
      print('o'+oldValue.text.length.toString());
      if(newValue.selection.extentOffset == newValue.text.length){
        offset=text.length;
        print('ok');
      }
      else{
        int plus=0;
        int dif=text.length-newValue.text.length;
        if(dif.abs()==1 ){
          plus=dif;
        }
        offset=(newValue.selection.extentOffset-newValue.selection.baseOffset)
            +newValue.selection.extentOffset
            +plus;
        if(offset>=1 && text[offset-1]==separator){
          offset--;
        }
      }
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: offset),
      );
    }
    return newValue;

  }

  int countSeparator(TextEditingValue newValue){
    int length=newValue.text.substring(0,newValue.selection.extentOffset).replaceAll(separator,'').length;
    return length~/nombreCaractere;
  }

  String format(String text){
    String chaine= text.replaceAll(separator, '');
    print(text+"e");
    print(chaine+'e');

    StringBuffer finalChaine=StringBuffer();
    int i=chaine.length;
    int j=0;
    String ch="";
    print('-------------------------------------');
    while(i>0){
      j=i-nombreCaractere;
      print('j=${j}');
      if(i>nombreCaractere) {
        print("1: "+chaine.substring(j,i));
        ch=chaine.substring(j, i)+ch;
        ch=separator+ch;

      }
      else{
        print("2: "+chaine.substring(0,i));
        ch=chaine.substring(0,i)+ch;
        break;
      }

      i=j;
    }
    print(ch);
    return ch;

  }


}
