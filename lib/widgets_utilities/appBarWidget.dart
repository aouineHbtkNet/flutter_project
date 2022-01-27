import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/cart.dart';
import 'package:simo_v_7_0_1/screens/displayProducts.dart';
import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  String mytext;


  MyCustomAppBar({required this.mytext});
  @override
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderOne>(context);

    return AppBar(
        centerTitle:true,
        title: Text(mytext,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'font2',
                fontWeight: FontWeight.w500)),

        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () {},
          ),



          PopupMenuButton(
              color: Colors.amberAccent,
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onSelected: (value) async {

                if (value == 1) {

                  await  provider.getspTokenFromProvideOne();
                  String? token =  provider.spToken;
                  await provider.getLogoutEndpointApiResponseForAdmins(token ?? 'empty');
                  print ('Admin with token $token defaulted to empty ');

                  await provider.addspTokenFromProvideOne('empty');
                  await  provider.getspTokenFromProvideOne();
                  String? token2 =  provider.spToken;
                  print (" Admin Token changed to Empty =======================> $token2");
                  Navigator.pushNamed(context, Login.id);

                }


                if (value == 2)   {
                  await  provider.getspTokenFromProvideOne();
                   String? token = provider.spToken;
                  await provider.getLogoutEndpointApiResponse(token ?? 'empty');
                   await provider.addspTokenFromProvideOne('empty');
                  // await provider.clearAllSharedPreferences();
                  Navigator.pushNamed(context, Login.id);

                }
                if (value == 3) {

                  await  provider.getspTokenFromProvideOne();
                  String? token =  provider.spToken;
                  print (" Token :  $token");

                }

                if (value == 4) {

                  Navigator.pushNamed(context, DisplayProducts.id);

                }
                if (value == 5) {

                  Navigator.pushNamed(context, Cart.id);

                }



              },



              icon: Icon(Icons.more_vert_rounded),
              itemBuilder: (context) => [

                PopupMenuItem(
                  child: Text(' Logout for admins ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'font2',
                        // fontWeight: FontWeight.w500
                      )),
                  value: 1,
                ),


                PopupMenuItem(
                  child: Text('Logout for users',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'font2',
                      )),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text('Get Token ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'font2',
                      )),
                  value: 3,
                ),


                PopupMenuItem(
                  child: Text('Show products ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'font2',
                      )),
                  value: 4,
                ),



                PopupMenuItem(
                  child: Icon(Icons.shopping_cart),
                  value: 5,
                ),

              ]
          ),
        ]);
  }
}
