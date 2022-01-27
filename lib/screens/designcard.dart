import 'package:simo_v_7_0_1/apis/apiForSharedPreferences.dart';

import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/providers/cartWithNoChangeNotifier.dart';
import 'package:simo_v_7_0_1/providers/databaseProvider.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Designcart extends StatefulWidget {
  static const String id = '/ designcard';

  @override
  _DesigncartState createState() => _DesigncartState();
}





class _DesigncartState extends State<Designcart> {



  int howManyItems = 1;
  increaseCount() {
    howManyItems++;
    setState(() {
    });


  }
  decreaseCount() {
    if (howManyItems>1)
      howManyItems--;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {



    final providersecond = Provider.of<CartWithNoChangeProvider>(context);





    Product? productPassedFromFirstPage =
    ModalRoute.of(context)!.settings.arguments as Product?;
    int id = productPassedFromFirstPage!.id;
    // int price = productPassedFromFirstPage.product_price;
    // String name = productPassedFromFirstPage.product_name;
    // String foto = productPassedFromFirstPage.product_foto;
    // List<Map<String, dynamic>> list = [];
    //double total = price.toDouble() * howManyItems.toDouble();




         return Material(
           color: Colors.white,
           child: SafeArea(
             child: Container(
               padding: EdgeInsets.symmetric(horizontal: 10),
               child: Stack(
                 children: [
                   Column(
                     children: [


                       Container(

                         width: MediaQuery
                             .of(context)
                             .size
                             .width,
                         height: MediaQuery
                             .of(context)
                             .size
                             .height * 0.10,

                         margin: EdgeInsets.symmetric(vertical: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             InkWell(
                                 onTap: () {
                                   Navigator.of(context).pop();
                                 },
                                 child: Icon(
                                   Icons.arrow_back_ios_outlined,
                                   size: MediaQuery
                                       .of(context)
                                       .size
                                       .height * 0.07,
                                 )),
                             Container(
                               child: Row(
                                 children: [
                                   Stack(
                                     clipBehavior: Clip.none,
                                     children: [
                                       InkWell(
                                         onTap: () {
                                           Navigator.of(context).pushNamed(
                                               Cart.id);
                                         },
                                         child: Container(
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(
                                                 Radius.circular(14)),
                                           ),
                                           child: Icon(
                                             Icons.shopping_cart_outlined,
                                             size:
                                             MediaQuery
                                                 .of(context)
                                                 .size
                                                 .height *
                                                 0.07,
                                           ),
                                         ),
                                       ),
                                       Positioned(
                                         left: -40,
                                         top: -7,
                                         child: Container(
                                           height:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.07,
                                           width: MediaQuery
                                               .of(context)
                                               .size
                                               .width *
                                               0.1,
                                           alignment: Alignment.center,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(
                                                 Radius.circular(30)),
                                           ),
                                           child: Text(
                                             ' ${providersecond.count} ', // added fake
                                             style: TextStyle(
                                                 fontSize: MediaQuery
                                                     .of(context)
                                                     .size
                                                     .height *
                                                     0.02,
                                                 fontWeight: FontWeight.bold,
                                                 color: Colors.black),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ],
                         ),
                       ),


                       Container(

                         width: MediaQuery
                             .of(context)
                             .size
                             .width,
                         height: MediaQuery
                             .of(context)
                             .size
                             .height *
                             0.30,
                         //======================================================== 30 %
                         margin: EdgeInsets.symmetric(vertical: 10),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Container(
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width * 0.4,
                                 height: MediaQuery
                                     .of(context)
                                     .size
                                     .height * 0.40,
                                 decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(20),
                                     image: DecorationImage(
                                         image: NetworkImage(''),
                                         fit: BoxFit.cover)),
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(

                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width * 0.4,
                                 height: MediaQuery
                                     .of(context)
                                     .size
                                     .height * 0.30,

                                 decoration: BoxDecoration(

                                   borderRadius: BorderRadius.circular(20),
                                 ),
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(
                                       'PRICE :',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.026,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       ' \$23.987',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.03,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       'Antes :',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.026,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       ' \$27.987',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.03,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       'Descount:',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.026,
                                           fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       ' 20 OFF',
                                       style: TextStyle(
                                           fontSize:
                                           MediaQuery
                                               .of(context)
                                               .size
                                               .height *
                                               0.03,
                                           fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ),


                       Container(
                           width: MediaQuery
                               .of(context)
                               .size
                               .width * 0.8,
                           height: MediaQuery
                               .of(context)
                               .size
                               .height *
                               0.20,
                           //================================================================== 20 %

                           decoration: BoxDecoration(

                             borderRadius: BorderRadius.circular(20),

                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment
                                     .spaceBetween,
                                 children: [
                                   Text(
                                     'MARCA :  ',
                                     style: TextStyle(
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height *
                                           0.030,
                                     ),
                                   ),
                                   Text(
                                     ' Alpina  ',
                                     style: TextStyle(
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height *
                                           0.030,
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment
                                     .spaceBetween,
                                 children: [
                                   Text(
                                     'CONTENIDO :  ',
                                     style: TextStyle(
                                       fontSize:
                                       MediaQuery
                                           .of(context)
                                           .size
                                           .height * 0.03,
                                     ),
                                   ),
                                   Text(
                                     ' 200ml  ',
                                     style: TextStyle(
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height *
                                           0.030,
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(
                                     'DESCRIPCIÓN:  :  ',
                                     style: TextStyle(
                                       fontSize:
                                       MediaQuery
                                           .of(context)
                                           .size
                                           .height * 0.03,
                                     ),
                                   ),
                                 ],
                               ),
                               Text(
                                 ' Novedoso y bello follaje artificial, sirve para'
                                     ' cualquier espacio, fachada, balcón, jardín,'
                                     ' terraza, negocio, intervención urbana,'
                                     ' infinidad de cosas, los follajes ',
                                 style: TextStyle(
                                   fontSize:
                                   MediaQuery
                                       .of(context)
                                       .size
                                       .height * 0.020,
                                 ),
                               ),
                             ],
                           )),


                       Container(
                         width: MediaQuery
                             .of(context)
                             .size
                             .width * 0.6,
                         height: MediaQuery
                             .of(context)
                             .size
                             .height *
                             0.10,
                         //================================================= 10 %
                         margin: EdgeInsets.symmetric(vertical: 20),
                         decoration: BoxDecoration(

                           borderRadius: BorderRadius.circular(20),
                         ),

                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             InkWell(
                                 onTap: () {
                                   increaseCount();
                                 },
                                 child: Icon(
                                   Icons.add,
                                   size: MediaQuery
                                       .of(context)
                                       .size
                                       .height * 0.07,
                                 )),
                             Container(
                               decoration: BoxDecoration(
                                 color: Colors.grey,
                                 borderRadius: BorderRadius.circular(20),
                               ),

                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width * 0.3,
                               height: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.08,
                               child: Center(
                                 child: Text(
                                  howManyItems.toString(),
                                   style: TextStyle(
                                     fontSize:
                                     MediaQuery
                                         .of(context)
                                         .size
                                         .height * 0.07,
                                   ),
                                 ),
                               ),
                             ),
                             InkWell(
                                 onTap: () {
                                   decreaseCount();
                                 },
                                 child: Icon(
                                   Icons.remove,
                                   size: MediaQuery
                                       .of(context)
                                       .size
                                       .height * 0.07,
                                 )),
                           ],
                         ),
                       ),
                       Container(
                         width: MediaQuery
                             .of(context)
                             .size
                             .width * 0.6,
                         height: MediaQuery
                             .of(context)
                             .size
                             .height *
                             0.06,
                         // ====================================================20 %
                         margin: EdgeInsets.symmetric(vertical: 20),
                         decoration: BoxDecoration(
                           color: Colors.grey,
                           borderRadius: BorderRadius.circular(20),
                         ),

                         child: InkWell(




                           onTap: () async {


                              await providersecond.addIvaFromCartProvider(0.2);//20%
                              await providersecond.addEnvioFromCartProvider(0.0);
                              await providersecond.addDiscountFromCartProvider(0.1);//10%

                             await  providersecond.GetIvaFromCartProvider();
                             await  providersecond.GetEnvioFromCartProvider();
                             await  providersecond.GetDiscountFromCartProvider();


                             double? ivae =  providersecond.iva;

                             print (' ivaaaaaaaaaaaaaaaaa         from  shredpreferences===============$ivae');



                             await providersecond.setTotal();










                              howManyItems=1;







                             //Navigator.of(context).pop();




                              // Navigator.of(context).pushNamed(Cart.id);


                           },

                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text(
                                 'ADD TO CART  ',
                                 style: TextStyle(
                                     fontSize:
                                     MediaQuery
                                         .of(context)
                                         .size
                                         .height * 0.03,

                                     color: Colors.black),
                               ),
                               Icon(
                                 Icons.shopping_cart_outlined,
                                 size:
                                 MediaQuery
                                     .of(context)
                                     .size
                                     .height *
                                     0.03,
                               ),

                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ),
         );
       }

}

// onTap: ()  async {
//  Map<String,dynamic> toJson (){
//
//    return {
//      'imageUrl':foto,
//      'productName':name,
//      'quantity':qnty,
//      'price':price };
//
//  };
//
//
//  list.add(toJson());
//
//
//  print('ToJson()');
//
//  print(toJson());
//  print('list');
//  print(list);
//
//
//  Navigator.of(context).pushNamed(Cart.id ,arguments: list);

//Navigator.of(context).pop();

// },,
