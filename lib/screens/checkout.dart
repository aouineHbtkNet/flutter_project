import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simo_v_7_0_1/screens/mercadoPagoWebPage.dart';
import 'package:simo_v_7_0_1/utils/my_first_flutter_channel.dart';

import 'package:simo_v_7_0_1/utils/globals.dart ' as globals;
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

import 'dart:async';

// import 'package:flutter_payu_unofficial_example/credentials.dart';
// import 'package:flutter_payu_unofficial_example/widgets/common_text_field.dart';


class Checkout extends StatefulWidget {
  static const String id = '/checkout';


  const Checkout();



  @override
  _CheckoutState createState() => _CheckoutState();
}




class _CheckoutState extends State<Checkout> {




  // var idGot;
  // var mercadoPagoUrl;
  // Future<Map<String,dynamic>> armarPreferencia() async {
  //     // var mp = MP(globals.mpClientID, globals.mpClientSecret);
  //   //var mp = MP('5089183367610367', 'xzvyE3TR2qX8g2YHvHr5bFrpgf79hlen');
  //     var preference = {
  //       "items": [
  //         {
  //           "title": "Test Modified 222",
  //           "quantity": 1,
  //           "currency_id": "USD",
  //           "unit_price": 10.1
  //         }
  //       ],
  //       "payer": {
  //         "name": "simo",
  //         "email": "adammyhero2019@gmail.com"
  //       },
  //       // "payment_methods": {
  //       //   "excluded_payment_types": [
  //       //     {"id": "ticket"},
  //       //     {"id": "atm"}
  //       //   ]
  //       // }
  //     };
  //
  //   //   var result = await mp.createPreference(preference);
  //   //    idGot = result['response']['id'];
  //   //    mercadoPagoUrl = result['response']['init_point'];
  //   //
  //   // //  print(result);
  //   //   print (mercadoPagoUrl);
  //
  //     // return result; original
  //     return result;
  //
  //   }





  // javascriptMode: JavascriptMode.unrestricted,


  @override
  Widget build(BuildContext context) {
    return Text('');


    // return Scaffold(
    //     appBar: AppBar(
    //       title: Text("Mercado Pago"),
    //     ),
    //      body: SingleChildScrollView(
    //
    //       child: Center(
    //         child: MaterialButton(
    //           color: Colors.blue,
    //            onPressed:() async{
    //               await armarPreferencia();
    //              //   PaymentResult result = await MercadoPagoMobileCheckout.startCheckout(
    //              //       globals.mpTestPublicKey,
    //              //   //'APP_USR-b883e5aa-9407-4caf-8e64-84f149efe51d',
    //              //   idGot,
    //              // );
    //              // print('  response from the plugin ==========================================================================${result.toString()}');
    //               print ('++++++++++++++++++++++++++++++++++++++++++++++++++++++++=$mercadoPagoUrl');
    //
    //                 var route = MaterialPageRoute( builder: (BuildContext  context) => MercadoPagoWebPage(mercadoPagoUrl));
    //
    //               Navigator.of(context).push(route);
    //
    //
    //
    //
    //
    //            },
    //           child: Text(
    //             "Comprar con Mercado Pago",
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ),
    //
    // );
  }
  }
