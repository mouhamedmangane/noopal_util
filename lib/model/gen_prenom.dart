import 'package:noppal_util/model/gen_data.dart';
import 'package:noppal_util/model/gen_data_array_impl.dart';

class GenPreNom extends GenDataArrayImpl<String>{
  @override
  List<String> getData() {
    return[
      'Modou','Samba','Pathé', 'Pape Demba',"Ndiokor",
      'Ami','Ndeye Fatou','Khady','Soda','Ndiaté','Paya',
      "Ngor",'Bathie','Pape Samba','Ndaté','Nioba'
    ];
  }

}