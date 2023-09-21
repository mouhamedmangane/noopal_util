import 'dart:math';

import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_letter.dart';

class GenMatAuto extends GenDataArrayImpl<String>{
  @override
  List<String> getData() {
    GenLetter genLetter=GenLetter();
    List<String> l=[];
    Random r=Random(DateTime.now().microsecondsSinceEpoch);
    for(int i=0;i<20;i++){
      StringBuffer sb=StringBuffer();
      sb.write("DK");
      sb.write(_nextNumber(r));
      sb.write(genLetter.random());
      sb.write(genLetter.random());
      l.add(sb.toString());
    }
    return l;
  }

  int _nextNumber(Random r){
    return ((9999-1000)*r.nextDouble()).floor()+1000;
  }

}