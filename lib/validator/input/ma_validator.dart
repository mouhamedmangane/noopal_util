
abstract class MyValidator{
  String? value;
  String? attribute;

  MyValidator({this.value,this.attribute});


  void reinit(String? _value,String _attribute,){
    value=_value;
    attribute=_attribute;
  }

  void setValue(String _value){
    value=_value;
  }

  void setAttribute(String _attribute){
    attribute=_attribute;
  }

   bool validate();
   String message();
}