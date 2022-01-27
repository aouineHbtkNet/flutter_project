import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';

import 'dash_board_for_admins.dart';


class StartPage extends StatelessWidget {


  static const String id = '/startPage';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);
    return Scaffold(
      appBar: MyCustomAppBar(
        mytext: 'Crear tu cuenta',),
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
                        'Crear una cuenta',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),

                      SizedBox(
                        height: 60,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: 'Entrar el nombre completo ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),



                        ),

                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor,entrar tu nombre';
                          }
                        },
                      ),

                      SizedBox(
                        height: 40,
                      ),


                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: 'Entrar el email ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),



                        ),

                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor,entrar tu email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),


                      TextFormField(
                        keyboardType: TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: 'Entrar la contarsena ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),



                        ),

                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor,entrar tu contrasena';
                          }
                        },
                      ),

                      SizedBox(
                        height: 40,
                      ),


                      ElevatedButton(
                        onPressed:() async{



                          if (_formKey.currentState!.validate()) {
                            AdminLoginResponse adminLoginResponse = AdminLoginResponse();

                            adminLoginResponse = await ProviderOne().getRegisterEndpointApiResponseForAdmins(
                                _nameController.text,
                                _emailController.text,
                                _passwordController.text);

                            print('loginEndpointApiResponseModel.token<<<<<<<<<=====>>>>>>>>>>  ${adminLoginResponse.token}');

                            await provider.addspTokenFromProvideOne(adminLoginResponse.token);
                            await provider.addUserIdToSPFromProviderOne(adminLoginResponse.id);
                            await provider.addUserNameToSPromProviderOne(adminLoginResponse.name);
                            await provider.addUserEmailToSPFromProviderOne(adminLoginResponse.email);
                            await provider.getspTokenFromProvideOne();
                            await provider.getuserIdFromSP();
                            await provider.getuserEmailFromSP();
                            await provider.getuserNameFromSP();
                            print(' provider.Admincookie =====>  ${provider.spToken}');
                            print(' provider.userId =====>  ${provider.idFromSharedPtreferences.toString()}');
                            print(' provider.AdminName =====>  ${provider.userNameFromSharedPtreferences}');
                            print(' provider.AdminEmail =====>  ${provider.emailFromSharedPtreferences}');
                            Navigator.pushNamed(context, DashBoard.id);

                          }

                        },

                        child: Text('Enviar'),
                      ),


                      SizedBox(
                        height: 50,
                      ),

                      Text('Tengo cuenta.',style: TextStyle(fontSize: 14,color: Colors.blue),),


                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed:() async{
                            Navigator.pushNamed(context, Login.id);

                          },


                          child: Text('Ingresar '),
                        ),

                      ),










                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
  }

