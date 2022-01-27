import 'dart:convert';
import 'dart:io';
import 'package:simo_v_7_0_1/apis/apiForSharedPreferences.dart';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';

import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/modals/listOfProduct.dart';
import 'package:simo_v_7_0_1/modals/loginEndpointApiResponseFile.dart';
import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/modals/profileEndpointApiResponseFile.dart';
import 'package:simo_v_7_0_1/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


enum States { initial, loading, loaded }

class ProviderOne extends ChangeNotifier {


 late ProfileEndpointApiResponseModel user;
 States state = States.initial;















 var posts;
 getCategoriasa (String token) async {
  posts =await ApisForModals().getCategorias(token) ;
 // state = States.loaded;
  notifyListeners();
 }








// // bringproductos
//   var response ;
//     bringproductos (String token) async {
//      response =await ApisForModals().bringproductos(token) ;
//      state = States.loaded;
//     notifyListeners();
//
//
//
//  }














 //Getting categorias

 List<Category> categoriesList = [];
 getCategorias (String token) async {
  categoriesList = await ApisForModals().getCategorias(token) ;
  state = States.loaded;
  notifyListeners();
 }








 List<Product> productList = [];
 getProduct() async {
  productList = await ApisForModals().getProducts();
  state = States.loaded;
  notifyListeners();
 }





 postUserRegister() async {
  user = await ApisForModals().postUser();
  state = States.loaded;

  notifyListeners();
 }

 //++++++++++++++++++++++++++++++  add product for admin +++++++++++++++++++++++++++++++++++++++++++++++++


 Future<bool> addProduct(String mytoken ,File  foto ) async {

  Map<String, String> _Header = {
   // 'Content-Type': 'application/json',
   'Content-Type': 'application/x-www-form-urlencoded',
   'Accept': 'application/json',
   'Authorization': 'Bearer $mytoken',

  };
  Uri _url = Uri.parse(

      //'http://192.168.1.22/APiSAnctumSPAJet/public/client/user/logout');

  //'http://10.0.2.2:80/APiSAnctumSPAJet/public/client/user/logout');

   'http://192.168.1.22/APiSAnctumSPAJet/public/admin/upload');
      //'http://10.0.2.2:8000/admin/upload'); original

  //"product_foto":"http:\/\/127.0.0.1:8000\/adam\/1637089375.png","product_name":"name1","product_price":11111,"product_description"
  Map<String, dynamic> body = {


   'upload':foto,



  };


  http.Response response = await http.post(
       _url, headers: _Header, body: jsonEncode(body));





  var data = jsonDecode(response.body);


   print(data);

  return true;
 }

 postuserCredentials(Map <String, String> body) async {
  user = await ApisForModals().postUser2(body);
 }


//==================================================Get   userLogoout =========================

 Future<bool> getLogoutEndpointApiResponse(String mytoken) async {
  Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
   'Authorization': 'Bearer $mytoken',
  };

  Uri _tokenUrl = Uri.parse(

      'http://192.168.1.22/api_v_1/public/client/user/logout');


      // 'http://10.0.2.2:80/APiSAnctumSPAJet/public/client/user/logout');
  http.Response response = await http.post(_tokenUrl, headers: _loginHeader,);
  var data = jsonDecode(response.body);

  print(data["message"]);
  print(data["message"]);
  print(data["message"]);

  return true;
 }






// ============================== Future get loginEndpointapi response for users  OK =======================

 Future<LoginEndpointApiResponseModel> getLoginEndpointApiResponse(String email,
     String password) async {

  const Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
  };
  Uri _tokenUrl = Uri.parse(
      // 'http://10.0.2.2:80/APiSAnctumSPAJet/public/publicapi/user/login');==============> original address

      'http://10.0.2.2:8000/api_v_1/public/publicapi/admin/login');





  Map<String, String> body = {'email': email, 'password': password};


  http.Response response = await http.post(
      _tokenUrl, headers: _loginHeader, body: jsonEncode(body));

  var data = jsonDecode(response.body);

  LoginEndpointApiResponseModel loginEndpointApiResponseModel = LoginEndpointApiResponseModel();
  loginEndpointApiResponseModel = LoginEndpointApiResponseModel.fromJson(data);

  return loginEndpointApiResponseModel;
 }


//====================================Future getUserToken ================================


 Future<String> getUserToken(String email, String password) async {
  const Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
  };
  Uri _tokenUrl = Uri.parse(
      'http://10.0.2.2:80/APiSAnctumSPAJet/public/publicapi/user/login');

  Map<String, String> body = {'email': email, 'password': password};

  http.Response response = await http.post(_tokenUrl,
      headers: _loginHeader, body: jsonEncode(body));
  var data = jsonDecode(response.body);

  return data['token'];
 }


//==============================  getUserProfile =======================================

 Future<ProfileEndpointApiResponseModel> getUserProfile(String tokenn) async {

  final Map<String, String> _userprofileHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
   'Authorization': 'Bearer $tokenn',
  };
  Uri _tokenUrl = Uri.parse(
      'http://10.0.2.2:80/APiSAnctumSPAJet/public/client/user/profile');

  http.Response response = await http.post(_tokenUrl, headers: _userprofileHeader);

  ProfileEndpointApiResponseModel modalFromUserProfileApi = ProfileEndpointApiResponseModel();

  var data = jsonDecode(response.body);

  modalFromUserProfileApi = ProfileEndpointApiResponseModel.fromJson(data);

  return modalFromUserProfileApi;
 }


//==================================  addTokenToSPFromProviderOne(String value)  ================================


 addspTokenFromProvideOne(String value) async {
  await ApiForSharedPreferences().addspTokenToSPFromApiForSP(value);
  state = States.loaded;
  notifyListeners();
 }

//==================================  getTokenFromSPFromProviderOne() ================================
 String? spToken = '';

 getspTokenFromProvideOne() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  spToken = prefs.getString('spToken');
 // state = States.loaded;
  notifyListeners();
 }


 //   String spToken ='' ;
 // getspTokenFromProvideOne() async {
 //  spToken   =  await ApiForSharedPreferences().getspTokenToSPFromApiForSP();
 //  state = States.loaded;
 //   notifyListeners();
 //  }

//==================================  addUserNameToSPromProviderOne(String value) ================================

 addUserNameToSPromProviderOne(String value) async {
  await ApiForSharedPreferences().addUserNameToSP(value);
  state = States.loaded;
  notifyListeners();
 }

 //============================== getuserNameFromSP() =======================================

 String userNameFromSharedPtreferences = '';

 getuserNameFromSP() async {
  userNameFromSharedPtreferences =
  await ApiForSharedPreferences().getuserNameFromSP();
  state = States.loaded;
  notifyListeners();
 }

//============================================== Adding  SharedPreferences  Email  3.0=============================
 addUserEmailToSPFromProviderOne(String value) async {
  await ApiForSharedPreferences().addUserEmailToSP(value);
  state = States.loaded;
  notifyListeners();
 }

//==================================Get shared preferences  Email 3.1  ========================================
 String emailFromSharedPtreferences = '';

 getuserEmailFromSP() async {
  emailFromSharedPtreferences =
  await ApiForSharedPreferences().getuserEmailFromSP();
  state = States.loaded;
  notifyListeners();
 }

//====================================Adding shared preferences Id  4.0 =======================================

 addUserIdToSPFromProviderOne(int value) async {
  await ApiForSharedPreferences().addUserIdToSP(value);
  state = States.loaded;
  notifyListeners();
 }

//==================================Get shared preferences  id 4.1  ========================================

 int idFromSharedPtreferences = 0;

 getuserIdFromSP() async {
  idFromSharedPtreferences = await ApiForSharedPreferences().getuserIdFromSP();
  state = States.loaded;
  notifyListeners();
 }


 removeAllToSPFromProviderOne() async {
  await ApiForSharedPreferences().logoutFromSP();
  state = States.loaded;
  notifyListeners();
 }


 clearAllSharedPreferences() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.clear();
   print('success');
   state = States.loaded;
   notifyListeners();
  }


 String destination ='';
 checkLogin() async {
   await getspTokenFromProvideOne();
   if (spToken =='notloggedyet'){
    destination == Cart.id;
   } else{
    destination == Cart.id;
   }
  state = States.loaded;
  notifyListeners();
 }



 //===========================================================================================================================
//============================================================================================================================
//==========================================================================================================================
//===================================Admins functions=======================================================================
//==========================================================================================================================
//============================================================================================================================


 //



// admin registar

 Future<AdminLoginResponse> getRegisterEndpointApiResponseForAdmins   (String name ,String email,String password) async {
  const Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
  };
  Uri _tokenUrl = Uri.parse('http://192.168.1.22/api_v_1/public/publicapi/admin/register');
  Map<String, String> body = {
   'name':name,
   'email': email,
   'password': password};

  http.Response response = await http.post(
      _tokenUrl,
      headers: _loginHeader,
      body: jsonEncode(body));

  var data = jsonDecode(response.body);

  AdminLoginResponse adminLoginResponse = AdminLoginResponse();
  adminLoginResponse = AdminLoginResponse.fromJson(data);

  return adminLoginResponse;
 }






 // ============================== Future get loginEndpointapi response for Admins  OK =======================
 Future<AdminLoginResponse> getLoginEndpointApiResponseForAdmins   (String email,String password) async {
  const Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
  };
  Uri _tokenUrl = Uri.parse(

'http://192.168.1.22/api_v_1/public/publicapi/admin/login');
  Map<String, String> body = {'email': email, 'password': password};

  http.Response response = await http.post(
      _tokenUrl, headers: _loginHeader, body: jsonEncode(body));

  var data = jsonDecode(response.body);

  AdminLoginResponse adminLoginResponse = AdminLoginResponse();
  adminLoginResponse = AdminLoginResponse.fromJson(data);

  return adminLoginResponse;
 }



//==========================LogoutForAdmins===========================

 Future<bool> getLogoutEndpointApiResponseForAdmins(String mytoken) async {

  Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
   'Authorization': 'Bearer $mytoken',
  };
  Uri _tokenUrl = Uri.parse(

      //http://192.168.1.22/APiSAnctumSPAJet/public/admin/logout/admin

      'http://192.168.1.22/api_v_1/public/admin/logout/admin');


  // 'http://10.0.2.2:80/APiSAnctumSPAJet/public/client/user/logout');
  http.Response response = await http.post(_tokenUrl, headers: _loginHeader,);
  var data = jsonDecode(response.body);

  print(data["message"]);
  print(data["message"]);
  print(data["message"]);

  return true;
 }





//==========================AddProductForAdmins===========================

 Future<bool> AddProduct (String mytoken , var image , String productName ,int productPrice ,String ProductDescription  ) async {

  Map<String, String> _loginHeader = {
   'Content-Type': 'application/json',
   'Accept': 'application/json',
   'Authorization': 'Bearer $mytoken',
  };
  Uri _tokenUrl = Uri.parse('http://10.0.2.2:80/APiSAnctumSPAJet/public/admin/addproduct');

  Map<String, dynamic> body =

  {'product_foto': image,
   'product_name': productName,
   'product_price': productPrice,
   'product_description':ProductDescription,
  };


  http.Response response = await http.post(
      _tokenUrl, headers: _loginHeader, body: jsonEncode(body));

  var data = jsonDecode(response.body);

  return true;
 }

}

