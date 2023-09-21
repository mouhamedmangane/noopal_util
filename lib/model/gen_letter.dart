import 'package:noppal_util/model/gen_data_array_impl.dart';

class GenLetter extends GenDataArrayImpl<String>{
  @override
  List<String> getData() {
    return List.generate(26, (index) => String.fromCharCode(index+65));
  }

}