import 'package:flutter/cupertino.dart';

enum HomeState2 {normal2, cart2}

class HomeController2 extends ChangeNotifier{
  HomeState2 homeState2 = HomeState2.normal2;

  void ChangeHomeState2(HomeState2 state2){
    homeState2 = state2;
    notifyListeners();
  }
}