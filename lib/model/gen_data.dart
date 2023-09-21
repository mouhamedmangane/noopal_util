import 'dart:math';

abstract class GenData<T>{
  T next();
  T random();
  T getCurrent();

}