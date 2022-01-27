import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
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
import 'login.dart';



class Entrance extends StatelessWidget {
  static const String id = '/enterance';

  List<Category> posts=[];

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

    posts = data
        .map(
          (dynamic item) => Category.fromJson(item),
    )
        .toList();

    return posts;
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);

    return Scaffold(
      body:Center(
        child: TextButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).accentColor),
              padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20)),
              textStyle: MaterialStateProperty.all(TextStyle(
                color: Colors.black,
              )),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
          onPressed: () async {
              await provider.getspTokenFromProvideOne();
              String? token = provider.spToken;
              print('token from upload product : $token');
              // Uint8List data = await pickedFile!.readAsBytes(); to be put back
              // List<int> list = data.cast();  to be put back

              // List <Category>  list = await  ApisForModals().getCategorias(token ?? 'empty');
              await getget(token ?? 'empty');
              print (' bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb$posts');

              Navigator.pushNamed(context, TestPage.id,arguments: posts
              );








          },
          child: Text("My Button",
              style: TextStyle(
                fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.normal)),
        ),
      ),



    );
  }
}
