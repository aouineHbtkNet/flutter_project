import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:path/path.dart';

import 'cart.dart';
import 'displayProducts.dart';

class DetailsOfSelectedProducts extends StatefulWidget {
  static const String id = '/DetailsOfSelectedProducts';

  @override
  _DetailsOfSelectedProductsState createState() =>
      _DetailsOfSelectedProductsState();
}

class _DetailsOfSelectedProductsState extends State<DetailsOfSelectedProducts> {


  int quantity= 1;

  incrementQuantity() {
    this.quantity++;
  }

  decrementQuantity() {
    this.quantity--;
  }


  @override
  Widget build(BuildContext context) {
    Product? productPassedFromFirstPage = ModalRoute.of(context)!.settings.arguments as Product?;
    final provider = Provider.of<ProviderOne>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        centerTitle: true,
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){},
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      // Ink.image(
                      //   height: 200,
                      //     image: NetworkImage(productPassedFromFirstPage!.product_foto==null ? '' :productPassedFromFirstPage.product_foto),
                      // ),
                      Text('BRAND')

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('',
                      style: TextStyle(color: Colors.black54),
                      ),
                      Text(' : ',
                        style: TextStyle(color: Colors.black54),
                      ),





                  ],),

                ),
                ButtonBar(),
               TextButton(onPressed:(){




                   }, child:
                Text('ADD To CART')),


                TextButton(onPressed:(){
                 Navigator.of(context).pushNamed(Cart.id);
                }, child:
                     Text('BUY NOW')),



                ElevatedButton.icon(
                    onPressed: (){


                    },
                    icon: Icon(Icons.add),
                    label:Text('')),


            Text(''),



                ElevatedButton.icon(
                    onPressed: (){



                    },
                    icon: Icon(Icons.remove),
                    label:Text('')),











              ],),
          ),
        ),
      ),





    );
  }
}
