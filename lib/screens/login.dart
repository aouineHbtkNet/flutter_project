import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/dash_board_for_admins.dart';
import 'package:simo_v_7_0_1/screens/initial_page.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String id = '/ login';
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);
    // await context.read<ProviderTwo>().bringproductos();

    return Scaffold(
      appBar: MyCustomAppBar(
        mytext: provider.userNameFromSharedPtreferences == null ? 'Loading' : provider.userNameFromSharedPtreferences,),
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
                        'Ingresar a mi cuenta',
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
                          hintText: 'Entrar tu email ',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),



                        ),

                        controller: _emailController,

                        // validator: (value) {
                        //   if (value.isEmpty || !value.contains('@')) {
                        //     return 'Invalid email!';
                        //   }
                        // },



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
                          hintText: 'Entrar tu contrasena',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),



                        ),

                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Por favor ,entrar tu contrasena';
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

                            adminLoginResponse = await ProviderOne().getLoginEndpointApiResponseForAdmins(
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

                            setState(() {});
                          }

                        },

                        child: Text('Enviar '),
                      ),


                      SizedBox(
                        height: 50,
                      ),

                      Text('No tienes cuenta.',style: TextStyle(fontSize: 14,color: Colors.blue),),


                      SizedBox(
                        width: double.infinity, // <-- match_parent
                        child:  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          onPressed:() async{
                            Navigator.pushNamed(context, StartPage.id);

                          },


                          child: Text('Crear una cuenta '),
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
