


import 'ma_validator.dart';

class InferieurValidator extends MyValidator{
  double nombre;
  Function(String?,String?) ? specialMessage;
  InferieurValidator(this.nombre,{this.specialMessage});
  bool validate(){
    return double.parse(value!) <= nombre;
  }

  @override
  String message() {
    if(this.specialMessage!=null){
      return specialMessage!(attribute,value);
    }
    return '${attribute} doit etre inferieur à ${value} ';
  }
}