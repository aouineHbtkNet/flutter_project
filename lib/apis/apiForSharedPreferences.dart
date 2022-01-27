import 'dart:convert';
import 'dart:io';

import 'package:simo_v_7_0_1/modals/listOfProduct.dart';
import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/modals/profileEndpointApiResponseFile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiForSharedPreferences {




























  addspTokenToSPFromApiForSP(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('spToken',value);

  }


  Future <void >getspTokenToSPFromApiForSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('spToken');
  }

  //=====================================================CART  START =================================================


  addspEnvioToSPFromApiForSP(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('envio',value);

  }



  addspIvaFunction(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('iva',value);

  }
  double? ivaFromApi;
  Future <void >  getspIvaFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ivaFromApi =prefs.getDouble('iva');

  }



  addspDiscountToSPFromApiForSP(double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('discount',value);

  }












  //=================================================CART END ==============================================











  // Future getspTokenToSPFromApiForSP() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String tokenFromSharedPtreferences = prefs.getString('spToken') as String;
  //   return tokenFromSharedPtreferences;}


  //============================================== Adding SharedPreferences Name2.0  =============================

  addUserNameToSP(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', value);
  }

  //==================================Get shared preferences  Name  2.1========================================


  String  userNameFromSharedPtreferences ='';
  Future getuserNameFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userNameFromSharedPtreferences = prefs.getString('username') as String ;
    return userNameFromSharedPtreferences;
  }

  //============================================== Adding  SharedPreferences  Email  3.0=============================

  addUserEmailToSP(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', value);
  }

  //==================================Get shared preferences  Email 3.1  ========================================



  String  emailFromSharedPtreferences  ='';
  Future getuserEmailFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailFromSharedPtreferences  = prefs.getString('email') as String ;
    return emailFromSharedPtreferences ;
  }

//====================================Adding shared preferences Id  4.0 =======================================
  addUserIdToSP(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', value);
  }

  //==================================Get shared preferences  id 4.1  ========================================


  int idFromSharedPtreferences = 0;
  Future getuserIdFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idFromSharedPtreferences   = prefs.getInt('id') as int;
    return idFromSharedPtreferences;
  }





  Future logoutFromSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('spToken');
    prefs.remove( 'username');
    prefs.remove('email');
    prefs.remove('id');



  }


   clearAllSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
    print('success');
  }










}
