




import 'input/ma_validator.dart';

class ValidationUsine{


  static String? make(String ? value,String attribute,List<MyValidator> validators){
    bool validate=true;
    String message="";
    for(MyValidator validator in validators){
      validator.reinit(value, attribute);
      if(!validator.validate()){
        validate=false;
        message+="${validator.message()} \n";
      }
    }
    return (validate)? null: message;
  }
}