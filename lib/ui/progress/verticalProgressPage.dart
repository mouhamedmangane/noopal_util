

import 'package:flutter/material.dart';

class VerticalProgressPage extends StatelessWidget {
  String text;
  TextStyle textStyle;
  VerticalProgressPage(this.text,{
    this.textStyle=const TextStyle(fontSize: 32,),
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Align(
          alignment: Alignment.topCenter,
          child: Text(text,style: textStyle,textAlign: TextAlign.center,)
        ),

        Align(
          alignment: Alignment.center,
          child: Container(
            width: 150,
            height: 150,
            child: Expanded(child: CircularProgressIndicator(strokeWidth: 4,))
          ),
        ),
    ]);
  }
}
