import 'package:flutter/cupertino.dart';
import 'package:simo_v_7_0_1/modals/product.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/widgets_utilities/productoWidgets.dart';
import 'package:provider/provider.dart';

import 'designcard.dart';
import 'details_Of_producto.dart';
import 'details_products.dart';

class DisplayProducts extends StatefulWidget {
  static const String id = '/dispalyProducts';

  @override
  _DisplayProductsState createState() => _DisplayProductsState();
}

class _DisplayProductsState extends State<DisplayProducts> {
String name  = 'hajaja';

  @override
  Widget build(BuildContext context) {
    context.read<ProviderTwo>().bringproductos();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProviderTwo>().initialValues();
          await context.read<ProviderTwo>().bringproductos();
        },
        child: Consumer<ProviderTwo>(builder: (context, value, child) {
          return value.map.isEmpty && !value.error
              ? Center(child: CircularProgressIndicator())
              : value.error
                  ? Text('OPs Something went wrong ${value.errorMessage}')
                  : ListView.builder(
                      itemCount: value.map['producto'].length,
                      itemBuilder: (context, int index) {
                       // var data = value.map['producto'][index] ;
                        Map<String, dynamic> data = value.map['producto'][index] ;
                        var picture =data['foto_producto'];
                        print('pictureeeeeeee====================$picture ');
                        return Column(children: [

                          GestureDetector(
                            onTap: (){

                              Navigator.of(context).pushNamed(DetailsOfProducto.id,arguments: data);



                            },
                            child: Container(

                              color: Colors.blueGrey,
                              height: 120,
                               width: MediaQuery.of(context).size.width*0.90,
                               margin: EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:CrossAxisAlignment.center,
                                children: [


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        elevation: 10,
                                        child:
                                        Container(
                                            height: 90,
                                            width: MediaQuery.of(context).size.width*0.20,
                                              child: picture ==null ?
                                              Image.asset('assets/bread.png',fit: BoxFit.fill):
                                              Image.network('http://192.168.1.22/api_v_1/storage/app/public/notes/$picture',
                                            fit: BoxFit.fill),



                                        )
                                        ,),
                                      Card(
                                        elevation: 10,
                                        child:
                                        Container(
                                            height: 90,
                                            width: MediaQuery.of(context).size.width*0.60,
                                            child: Column(
                                              children: [
                                                Text('${data['precio_ahora'] }\$ ',style:
                                                TextStyle(fontWeight: FontWeight.bold,
                                                    color: Colors.blue),),

                                                Text('${data['nombre_producto']}',style: TextStyle(),),
                                                Text('${data['marca']}',style: TextStyle(),),
                                                data['precio_anterior'] ==0? Text('') : RichText(
                                                  text: TextSpan(
                                                    text:'${data['precio_anterior']} \$',
                                                    style: new TextStyle(
                                                      color: Colors.red,
                                                      decoration: TextDecoration.lineThrough,
                                                    ),
                                                  ),
                                                ),

                                                '${data['porciento_de_descuento']}'== null ? Text('') :  Text('${data['descuento']} % DE DESCUENTO' ,

                                                  style: TextStyle(color: Colors.green),) ,


                                              ],)

                                        ),
                                      ),


                                    ],
                                  )
                              ],),
                            ),
                          ),
                        ]);
                      });
        }),
      ),
    );
  }
}

class ProductoCard extends StatelessWidget {
  const ProductoCard({Key? key, required this.map, required this.map2})
      : super(key: key);
  final Map<String, dynamic> map;
  final map2;

  @override
  Widget build(BuildContext context) {
    var heading = ' PRECIO : \$ ${map['precio_ahora']} ';
    var subheading = ' PRECIO ANTERIOR  : ${map['precio_anterior']}';
    var supportingText =
        'CONTENIDO :${map['contenido']}  ${map['medida']['medida']}   ';

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          image: NetworkImage('${map['foto_producto']}'),
          fit: BoxFit.fill,
        ),
      ),
      title: Text('${map['nombre_producto']}'),
      subtitle: Text(
        ' PRECIO : \$ ${map['precio_ahora']} ',
        style: TextStyle(color: Colors.black),
      ),
      trailing: map['oferta']['oferta'] == null
          ? Text('')
          : buildDiscountWidget(map['oferta']['oferta'], map['descuento']),
    );
  }
}
