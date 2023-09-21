

import 'package:noppal_util/model/gen_data_array_impl.dart';
import 'package:noppal_util/model/gen_nom.dart';
import 'package:noppal_util/model/gen_prenom.dart';

class GenNomComplet extends GenDataArrayImpl<String> {
  int taille;

  GenNomComplet(this.taille);
  @override
  List<String> getData() {
    GenNom genNom=GenNom();
    GenPreNom genPreNom=GenPreNom();
    List<String> list= List.generate(taille, (index) {
        return genPreNom.random()+' '+genNom.random();
    });
    return list;

  }

}