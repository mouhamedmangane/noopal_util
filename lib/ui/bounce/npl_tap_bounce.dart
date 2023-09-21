import 'dart:async';

import 'package:flutter/material.dart';

class NplTapBounce extends StatelessWidget {
  Duration  duration;
  Function()  ? onTap ;
  Widget child;
  bool _active=true;
  NplTapBounce({required this.child,this.duration=const Duration(milliseconds: 50),required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: onTap != null ? finalOnTap: null,
    );
  }

  void finalOnTap(){
    if(_active){
      realOnTap();
    }
  }
  void realOnTap(){
    _active=false;
    if(onTap != null) onTap!();
    Timer(duration,activation);
  }
  void activation(){
    _active=true;
  }
}
