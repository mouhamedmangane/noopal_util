




import 'ma_validator.dart';

class NotEmptyValidator extends MyValidator{


  bool validate(){
    return value!=null && value!.isNotEmpty;
  }

  @override
  String message() {
    return '${attribute} ne peut pas etre vide';
  }
}