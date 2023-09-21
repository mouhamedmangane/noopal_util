
import 'dart:math';

import 'package:noppal_util/model/gen_data_impl.dart';
import 'package:noppal_util/model/gen_nombre.dart';

import 'gen_data.dart';

class GenDateTime extends GenDataImpl<DateTime>{
  late DateTime start;
  late  DateTime end;
  late GenNombre genNombre;

  GenDateTime({
    DateTime ? start,
    DateTime ? end,
  }){
    this.start= (start!=null)?start:DateTime.parse(DateTime.now().year.toString()+'-01-01');
    this.end= (end!=null)?end:DateTime.now();
    this.genNombre=GenNombre(this.start.microsecondsSinceEpoch, this.end.microsecondsSinceEpoch);
  }


  @override
  DateTime nextImpl() {
    if(current!=null)
        return DateTime.fromMicrosecondsSinceEpoch(current!.microsecondsSinceEpoch+pow(10,6).toInt());
    return start;
  }

  DateTime randomImpl(){
    return DateTime.fromMicrosecondsSinceEpoch(genNombre.next());
  }



}