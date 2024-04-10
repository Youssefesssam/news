import 'package:flutter/material.dart';

class ProviderLanguage extends ChangeNotifier {
  String current="en";
  void setCurrentLocal(String selected){
    current=selected;
    notifyListeners();
  }
}