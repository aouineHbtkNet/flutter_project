import 'package:simo_v_7_0_1/apis/apiForSharedPreferences.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:path/path.dart';


class CartWithNoChangeProvider extends ChangeNotifier {












  List<CartModel> _items = [];
  double _subtotal = 0.0;
  double _total=0.0;
  double? _envio ;
   double? _iva ;
  double? _discount ;

   double  calculatIva(){ return _iva! *_subtotal ; }

 double calculateDiscount(){ return  _discount!*_subtotal;}


   double setTotal()  {
     return  _total = _subtotal   +  _envio!+  calculatIva()    + calculateDiscount();

  }


//===========================================Envio================================================
  addEnvioFromCartProvider( double value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('envio',value);
    notifyListeners();

  }

  GetEnvioFromCartProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _envio = prefs.getDouble('envio');
    notifyListeners();
  }

//===========================================Iva================================================
  addIvaFromCartProvider( double value) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble('iva',value);
  notifyListeners();

}

  GetIvaFromCartProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _iva = prefs.getDouble('iva');
    notifyListeners();
  }


//===========================================Discount ================================================

  addDiscountFromCartProvider( double value) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('discount',value);
    notifyListeners();

  }

  GetDiscountFromCartProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _discount = prefs.getDouble('discount');
    notifyListeners();
  }














  void addTobasket(CartModel cartModel) async {
    _items.add(cartModel);
    _subtotal += cartModel.recordTotal!;
    notifyListeners();
  }


  void removeFrombasket(CartModel cartModel) async {
    _items.remove(cartModel);
    _subtotal -= cartModel.recordTotal!;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get subtotal {
    return _subtotal;
  }
  double get total {
    return _total;
  }

  double? get envio {
    return _envio;
  }

  double? get iva {
    return _iva;
  }
  double? get discount {
    return _discount;
  }
  List<CartModel> get itemsInBasket {
    return _items;
  }


}
