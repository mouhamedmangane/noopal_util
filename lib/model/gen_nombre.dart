import 'dart:math';

import 'package:noppal_util/model/gen_data.dart';
import 'package:noppal_util/model/gen_data_impl.dart';

class GenNombre extends GenDataImpl<int>{
  int min;
  int max;
  int pas;
  Random rand=Random(DateTime.now().microsecondsSinceEpoch);

  GenNombre(this.min,this.max, {this.pas = 1}){
   current=min;
  }


  @override
  int nextImpl() {
    if(current!=null)
      return current=current!+pas;
    return min;
  }

  @override
  int randomImpl() {
    int nombre= ((max-min)*rand.nextDouble()).floor()+min;
    return nombre+(nombre%pas);
  }




}