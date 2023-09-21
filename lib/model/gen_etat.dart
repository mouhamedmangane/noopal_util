
import 'package:noppal_util/model/gen_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';

class GenEtat<T> extends GenDataArrayImpl<T>{
  List<T> data;

  GenEtat(this.data);

  @override
  List<T> getData() {
    return data;
  }

}