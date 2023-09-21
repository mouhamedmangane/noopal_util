

 import 'package:intl/intl.dart';

class NumberHelper{
  static String format(num number){
    var f = NumberFormat();
    return f.format(number);
  }
}