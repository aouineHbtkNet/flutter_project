import 'dart:convert';
import 'dart:io';

import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/modals/listOfProduct.dart';
import 'package:simo_v_7_0_1/modals/listcategory.dart';
import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/modals/profileEndpointApiResponseFile.dart';
import 'package:simo_v_7_0_1/modals/wholeList.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApisForModals {







  Future <List<Category>> getget(String token) async {
    Uri url = Uri.parse(
        'http://192.168.1.22/api_v_1/public/admin/getcategorias');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, String> body = {
    };
    http.Response response = await http.post(url,
        headers: header, body: jsonEncode(body));

    List<dynamic>    data = jsonDecode(response.body);
    List<Category> posts=[];
    posts = data
        .map(
          (dynamic item) => Category.fromJson(item),
    )
        .toList();

    return posts;
  }






















  // Future<List<Categorias>>  bringproductos(String token) async {
  //
  //   final Map<String, String> _userprofileHeader = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //   Uri _tokenUrl = Uri.parse(
  //       'http://192.168.1.22/api_v_1/public/admin/bringproductos');
  //
  //   http.Response response = await http.post(_tokenUrl, headers: _userprofileHeader);
  //   var data = jsonDecode(response.body);
  //   print (data);
  //  List<Categorias> cats  = List.from(data['categorias']).map((e)=>Categorias.fromJson(e)).toList();
  //    print (' the whols list cats ====================${cats}');
  //
  //    // print(' data categorias ============${data['categorias']}');
  //    //  print(' data medidas ============${data['medidas']}');
  //    //  print(' data ofertas ============${data['ofertas']}');
  //   return cats;
  // }
  //




















  List<Map<String, dynamic>> addTocartOfitems(itemTotal, price,
      howmanyItemsSelected, foto, name, list, numberOfItemsInCart) {
    itemTotal = price.toDouble() * howmanyItemsSelected.toDouble();

    Map<String, dynamic> toJson() {
      return {
        'imageUrl': foto,
        'productName': name,
        'howmanyItemsSelected': howmanyItemsSelected,
        'numberOfItemsInCart': numberOfItemsInCart,
        'price': price,
        'individualItemTotal': itemTotal,
      };
    }

    ;

    list.add(toJson());

    itemTotal = 0;
    howmanyItemsSelected = 1;


    print('list===============================================>');
    print(list);
    return list;
  }


//============================================================


  Future<List<Product>> getProducts() async {
    print('start function ');

    Uri url = Uri.parse(
        'http://192.168.1.22/api_v_1/public/publicapi/user/showproducts');
    var response = await http.get(url);
    var objectOrListData = jsonDecode(response.body);
    print(objectOrListData);
    print(objectOrListData);
    Products products = Products.fromJson(objectOrListData);
    print(products.list);
    return products.list;
  }

//----------------------------------------------------------------------------------

  static const String _publickey =
      'pk_test_d9b1feb2-e26c-4ab8-8c59-8e7759573ffd';

  static const Map<String, String> _tokenHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // static Uri _tokenUrl = Uri.parse('http://192.168.1.22/APiSAnctumSPAJet/public/publicapi/user/register');
  Uri _tokenUrl = Uri.parse(
      'http://192.168.1.22/APiSAnctumSPAJet/public/publicapi/user/login');

  //----------------------------------------------------------------------------------

  postUser() async {
    Map<String, String> body = {
      'email': 'simo8888@gmail.com',
      'password': '8888',
    };

    http.Response response = await http.post(_tokenUrl,
        headers: _tokenHeader, body: jsonEncode(body));

    var data = jsonDecode(response.body);
    ProfileEndpointApiResponseModel user = ProfileEndpointApiResponseModel
        .fromJson(data);

    // print(user.token);
    return user;

    //
    // return data['token'];
  }

  //==================================================

  postUser2(Map<String, String> body) async {
    http.Response response = await http.post(_tokenUrl,
        headers: _tokenHeader, body: jsonEncode(body));
    var data = jsonDecode(response.body);
    ProfileEndpointApiResponseModel user = ProfileEndpointApiResponseModel
        .fromJson(data);
    // print(user.);
    return user;
  }

//===========================================  ===============================================================================


  Future<String> getUserToken(Map<String, String> body) async {
    http.Response response = await http.post(_tokenUrl,
        headers: _tokenHeader, body: jsonEncode(body));

    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception('There is an error ');
    }
  }


  sendPostToDisplayProductList(Map<String, String> body) async {
    String token = await getUserToken(body);


    const Map<String, String> _tokenHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',

    };


    http.Response response = await http.post(_tokenUrl,
        headers: _tokenHeader, body: jsonEncode(body));
    var data = jsonDecode(response.body);
    ProfileEndpointApiResponseModel user = ProfileEndpointApiResponseModel
        .fromJson(data);

    return user;
  }




  getCategorias(String token) async {
    Uri url = Uri.parse(
        'http://192.168.1.22/api_v_1/public/admin/getcategorias');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, String> body = {
    };
    http.Response response = await http.post(url,
        headers: header, body: jsonEncode(body));

    var    data = jsonDecode(response.body);



    //     List<Category> posts = data
    //         .map(
    //     (dynamic item) => Category.fromJson(item),
    // )
    // .toList();
   // print (data);
   //  print(' data categorias ============${data['categorias']}');
   //  print(' data medidas ============${data['medidas']}');
   //  print(' data ofertas ============${data['ofertas']}');

    return data;
  }







}



