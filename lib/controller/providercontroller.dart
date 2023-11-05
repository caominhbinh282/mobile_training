import 'dart:core';

import 'package:flutter/cupertino.dart';

class ProviderController extends ChangeNotifier{

  //login
  final String _username = "caominhbinh123";
  final String _password = "123456";

  late int _userLogin = 0;
  int get userLogin => _userLogin;
  late int _passLogin = 0;
  int get passLogin => _passLogin;

  void login(String user, String pass){
    if(user == _username){
      _userLogin = 2;
    }else{
      _userLogin = 1;
    }
    if(pass == _password){
      _passLogin = 2;
    }else{
      _passLogin = 1;
    }
    notifyListeners();
  }


  //searchProvider--------------------------------------------------------------
  final String _adress1 = "Quy Nhon";
  final String _adress2 = "Da Nang";
  late final bool vip;
  late final double price;

  String _fromAdress = "";
  String get fromAdress => _fromAdress;
  String _toAdress = "";
  String get toAdress => _toAdress;

  //search
  void setLocation(String from, String to){
    if(from.toLowerCase() == _adress1.toLowerCase()){
      _fromAdress = _adress1;
    }
    if(to.toLowerCase() == _adress2.toLowerCase()){
      _toAdress = _adress2;
    }
    if(from.toLowerCase() == _adress2.toLowerCase()){
      _fromAdress = _adress2;
    }
    if(to.toLowerCase() == _adress1.toLowerCase()){
      _toAdress = _adress1;
    }
    if(from.toLowerCase() != _adress1.toLowerCase() && from.toLowerCase() != _adress2.toLowerCase()){
      _fromAdress = "1";
    }
    if(to.toLowerCase() != _adress1.toLowerCase() && to.toLowerCase() != _adress2.toLowerCase()){
      _toAdress = "1";
    }
    notifyListeners();
  }

  //passenger
  int _count = 1;
  int get count => _count;
  void setPassenger(bool sum){
    if(sum){
      _count++;
    }else if(_count > 1){
      _count--;
    }
    notifyListeners();
  }

  //dropdown type
  String _dropdownType = 'Normal';
  String get dropdownType => _dropdownType;
  void setDropDown(String value) {
    _dropdownType = value;
    if(value == "Normal"){
      price = 1.25;
    }else{
      price = 1.75;
    }
    notifyListeners();
  }

//resultSearchProvider----------------------------------------------------------
  double sumPrice(){
    return price * _count;
  }
}