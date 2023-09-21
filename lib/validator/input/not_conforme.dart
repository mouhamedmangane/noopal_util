


import 'package:flutter/material.dart';

import 'ma_validator.dart';

class NotConformValidator extends MyValidator{
  final TextEditingController controllerOne ;
  final TextEditingController controllerTwo;
  NotConformValidator({required this.controllerOne,required this.controllerTwo,String? value,String? attribute}):super(value: value,attribute: attribute);
  bool validate(){
    return controllerOne.text==controllerTwo.text;
  }

  @override
  String message() {
    return 'les mdp ne correspondent pas';
  }
}