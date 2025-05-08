import 'package:flutter/material.dart';

class Singleton {
  String email = "";
  ValueNotifier<int> recorde = ValueNotifier<int>(-1);

  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  static Singleton get instance => _instance;
}
