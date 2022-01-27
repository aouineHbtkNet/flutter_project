import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/addproducts.dart';
import 'package:simo_v_7_0_1/screens/testFile.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

import 'displayProducts.dart';
import 'entrance.dart';
import 'login.dart';
class Inventory extends StatelessWidget {
  static const String id = '/inventory';

  Future  bringproductos(String token) async {

    final Map<String, String> _userprofileHeader = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Uri _tokenUrl = Uri.parse(
        'http://192.168.1.22/api_v_1/public/admin/bringproductos');

    http.Response response = await http.post(_tokenUrl, headers: _userprofileHeader);
    var data = jsonDecode(response.body);
    print (data);
    return data;
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProviderOne>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '',
            style: TextStyle(fontFamily: 'OpenSans'),
          ),
          centerTitle: true,
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: Center(
              child: GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(10),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 4,
                  shrinkWrap: true,

                  children: <Widget>[

//========================================================Display==============================================================================
                    Material(
                      // color: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                         // side: BorderSide(color: Colors.black)

                      ),



                      child: InkWell(
                        onTap: () async{
                          Navigator.pushNamed(context, DisplayProducts.id
                          );
                        },
                        child:  Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Icon(
                                Icons.remove_red_eye_outlined,
                                size: 50,color: Colors.amber,
                              ),

                              Text(
                                'DISPLAY', style: TextStyle(color: Colors.black,),),



                            ],
                          ),
                        ),
                      ),
                    ),

//======================================================== Add ==============================================================================

                    Material(
                      // color: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          //side: BorderSide(color: Colors.black)


                      ),

                      child: InkWell(
                        onTap: () async {

                          // Navigator.pushNamed(context, TestPage.id,);
                          Navigator.pushNamed(context, AddProduct.id,);
                        },
                        child:  Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Icon(
                                Icons.add,
                                size: 50,color: Colors.amber,
                              ),

                              Text(
                                'ADD', ),



                            ],
                          ),
                        ),
                      ),
                    ),

//======================================================== Edit ==============================================================================

                    Material(
                      // color: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          //side: BorderSide(color: Colors.black)
                      ),

                      child: InkWell(
                        onTap: () async {
                          //
                          // await provider.getspTokenFromProvideOne();
                          //           String? token =  await provider.spToken;
                          //             await  provider.bringproductos( token ?? 'empty');
                          //
                          //             print (' printing response list of categorias  ${ await provider.response['categorias']}');
                          // print (' printing response list of medidas ${ await provider.response['medidas']}');
                          // print (' printing response list of ofertas  ${ await provider.response['ofertas']}');
                          //






                        },
                        child:  Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Icon(
                                Icons.edit_outlined,
                                size: 50,color: Colors.amber,
                              ),

                              Text(
                                'EDIT', ),



                            ],
                          ),
                        ),
                      ),
                    ),

//========================================================Delete==============================================================================

                    Material(
                      // color: Colors.white,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          //side: BorderSide(color: Colors.black)
                      ),

                      child: InkWell(
                        onTap: () {
                          print('1 was clicked');
                        },
                        child:  Container(

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Icon(
                                Icons.delete,
                                size: 50,color: Colors.amber,
                              ),

                              Text(
                                'DELETE', ),



                            ],
                          ),
                        ),
                      ),
                    ),

















                  ]
              ),
            )
        )
    );
  }
}
