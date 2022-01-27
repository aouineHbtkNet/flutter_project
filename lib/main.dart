import 'dart:async';

import 'package:simo_v_7_0_1/apis/sharedPreferences.dart';
import 'package:simo_v_7_0_1/providers/cartWithNoChangeNotifier.dart';
import 'package:simo_v_7_0_1/providers/colorProvider.dart';
import 'package:simo_v_7_0_1/providers/databaseProvider.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/CardSmall.dart';
import 'package:simo_v_7_0_1/screens/addNewcategory.dart';
import 'package:simo_v_7_0_1/screens/cart.dart';
import 'package:simo_v_7_0_1/screens/checkout.dart';
import 'package:simo_v_7_0_1/screens/dash_board_for_admins.dart';
import 'package:simo_v_7_0_1/screens/designcard.dart';
import 'package:simo_v_7_0_1/screens/details_Of_producto.dart';
import 'package:simo_v_7_0_1/screens/details_products.dart';
import 'package:simo_v_7_0_1/screens/displayProducts.dart';

import 'package:simo_v_7_0_1/screens/addproducts.dart';
import 'package:simo_v_7_0_1/screens/entrance.dart';
import 'package:simo_v_7_0_1/screens/initial_page.dart';
import 'package:simo_v_7_0_1/screens/inventory.dart';
import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:simo_v_7_0_1/screens/mercadoPagoWebPage.dart';
import 'package:simo_v_7_0_1/screens/payU.dart';
import 'package:simo_v_7_0_1/screens/register.dart';
import 'package:simo_v_7_0_1/screens/testFile.dart';
import 'package:simo_v_7_0_1/widgets_utilities/authContainer.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'modals/product.dart';


// fillNull() async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var h =prefs.getString('spToken') ;
//   h ='empty';
// }


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  //CartWithNoChangeProvider
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider<ProviderOne>(create: (_) => ProviderOne()),
      ChangeNotifierProvider<ProviderOfDataBase>(create: (_) => ProviderOfDataBase()),
      ChangeNotifierProvider<CartWithNoChangeProvider>(create: (_) => CartWithNoChangeProvider()),
      ChangeNotifierProvider<ProviderTwo>(create: (_) => ProviderTwo()),


    ],
    child: MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}





class _MyAppState extends State<MyApp> {





  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hHBTKNET',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.amberAccent,
        primarySwatch: Colors.blue,
      ),


      //AddProduct

       initialRoute: DashBoard.id ,
      //initialRoute: StartPage.id ,


      // initialRoute: AddProduct.id ,
      // onGenerateRoute: (parameterthatcarryingdataintheroute){
      //
      // if(parameterthatcarryingdataintheroute.name == DetailsOfProducto.id)// this is the condition to navigate to one route which is here :DetailsOfProducto.id
      //
      //   {
      // var   data =  parameterthatcarryingdataintheroute.arguments ; // puting the data sent in a variable type var named data
      //   return MaterialPageRoute(builder: (context)=>DetailsOfProducto(data: data,));// returning data inside the constructor
      //
      //
      // }



     // },



      routes: {

        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        Cart.id: (context) => Cart(),
        Checkout.id: (context) => Checkout(),
        AddProduct.id: (context) => AddProduct(),
        DisplayProducts.id: (context)=>DisplayProducts(),


        TestPage.id:(context)=> TestPage(),



        DashBoard.id:(context)=>AuthContaner(),



        Inventory.id:(context)=>Inventory(),
        DetailsOfSelectedProducts.id:(context) => DetailsOfSelectedProducts(),
        Designcart.id :(context)=>Designcart(),
        SmallCardInsteadTileList.id:(context)=>SmallCardInsteadTileList(),
        Entrance.id:(context)=>Entrance(),
        StartPage.id:(context)=>StartPage(),
        AddNewCategoryFormScreen.id:(context)=>AddNewCategoryFormScreen(),

        // PAyU.id:(context)=>  PAyU(),
        //   DetailsOfProducto.id:(context)  =>DetailsOfProducto(),
      },
    );
  }
}



