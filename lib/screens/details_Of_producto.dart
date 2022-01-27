import 'package:flutter/material.dart';
import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:provider/provider.dart';

class DetailsOfProducto extends StatelessWidget {
  static const String id = '/detailsOfProducts';

  // Map<String, dynamic> data;
var  data;


  DetailsOfProducto({required this.data});

  @override


  Widget build(BuildContext context) {

    Map<String, dynamic> map =data;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        centerTitle: true,
      ),
      // body: data==null
      //     ? CircularProgressIndicator()
      //     :
      //
      body:Container(
        child: Column(
          children: [
            Container(
              child: Text('jjjjjjjjjjjjjjjjjjjjjjjjjjjjj'),
            ),

            Container(
              child: SingleChildScrollView(
                child: Column(
                 children: [


                   Card(
                     elevation: 10,
                     child:
                     Container(
                         height: 120,
                         width: MediaQuery.of(context).size.width*0.60,
                         child: Image.network(data['foto_producto'],fit: BoxFit.fill)),),



                   SizedBox(height: 40,),

                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),

                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),
                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),



                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),




                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),




                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),




                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),




                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),



                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),




                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),



                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),


                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),



                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),
                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),

                   Card(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Marca'.toUpperCase() ,style: TextStyle(fontSize: 20,color: Colors.blueGrey,fontWeight: FontWeight.bold),),
                         Text('${data['marca']}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                       ],
                     ),
                   ),












                 ],
                  ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
