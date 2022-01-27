import 'dart:convert';

import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/apis/sharedPreferences.dart';
import 'package:simo_v_7_0_1/modals/profileEndpointApiResponseFile.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/addproducts.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  static const String id = '/ register';
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyCustomAppBar(
      //   mytext:  userSP == null ? 'Loading' :userSP,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Bienvenido a HBTKNET ',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),

                      SizedBox(
                        height: 60,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Entrarr tu Coreo Electronico',

                          hintStyle: TextStyle(
                            color: Colors.grey, // <-- Change this
                            fontSize: null,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          ),

                          // contentPadding: EdgeInsets.fromLTRB(5.0, 100.0, 5.0, 100.0),

                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.account_circle_outlined,
                            ),
                            onPressed: () {},
                          ),

                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        autofocus: true,
                        maxLines: 2,
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      //=========================================Password field=========================================

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Entrarr tu contrasena',
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        autofocus: true,
                        maxLines: 2,
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          }
                        },
                      ),

                      SizedBox(
                        height: 40,
                      ),

                      TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {





                              setState(() {});
                            }
                            Navigator.of(context).pushNamed(AddProduct.id);
                          },
                          child: Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )),










                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
