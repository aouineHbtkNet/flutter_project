import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'addproducts.dart';
import 'displayProducts.dart';
import 'login.dart';
import 'package:simo_v_7_0_1/uploadingImagesAndproducts.dart';

class AddNewCategoryFormScreen extends StatefulWidget {
  static const String id = '/addNewCategory';

  @override
  _AddNewCategoryFormScreenState createState() => _AddNewCategoryFormScreenState();
}

class _AddNewCategoryFormScreenState extends State<AddNewCategoryFormScreen> {
  final _formkey2 = GlobalKey<FormState>();
  final TextEditingController _categoryNameController = TextEditingController();





  //notification alert widget
  void showstuff(context,String mynotification){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Notification'),
        content: Text(mynotification),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, AddProduct.id);
          }, child: Text('Ok'))
        ],
      );


    });

  }





    @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add new category',
            style: TextStyle(fontFamily: 'OpenSans'),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formkey2,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  setState(() {
                    _categoryNameController.text = value;
                  });
                },
                controller: _categoryNameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Obligatorio';
                  } else if (value.length > 26) {
                    return "el text es largo";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Category',
                  hintText: 'Insert a new category',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),


              ElevatedButton(
                onPressed: () async {
                  if (_formkey2.currentState!.validate()) {

                    String message =   await ProductUploadingAndDispalyingFunctions().addNewcategory(_categoryNameController.text);
                    showstuff(context,message);


                  }
                },
                child: Text('Enviar '),

              ),





            ],
          ),
        ));
  }






}
