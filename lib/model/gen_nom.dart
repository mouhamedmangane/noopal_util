import 'package:noppal_util/model/gen_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';

class GenNom extends GenDataArrayImpl<String>{
  @override
  List<String> getData() {
    return[
      'Diop','Ndiaye','Fall', 'Sow',"Coly",
      'Séne','Ly','Gueye','Dieng','Mané','Sall',
      "Mangane",'Mboup','Faye','Cissoko','Fadiga'
    ];
  }

}