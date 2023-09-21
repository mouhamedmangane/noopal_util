import 'dart:math';

import 'package:noppal_util/model/gen_data_impl.dart';

class GenId extends GenDataImpl<int>{
  int postition=1;

  int nextImpl(){
    postition++;
    return postition;
  }

  @override
  int randomImpl() {
    return Random(DateTime.now().microsecondsSinceEpoch).nextInt(postition);
  }







}