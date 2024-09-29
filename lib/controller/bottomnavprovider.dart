import 'dart:developer';

import 'package:flutter/material.dart';

class BottomNavProvider extends ChangeNotifier{

  int bottomindex=3;

  void updateindex(int selectedIndex){
    bottomindex = selectedIndex;

    log('index=$bottomindex');
    notifyListeners();

  }

}