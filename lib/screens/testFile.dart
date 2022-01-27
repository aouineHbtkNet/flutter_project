import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/modals/category.dart';
import 'package:simo_v_7_0_1/modals/wholeList.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

import 'displayProducts.dart';
import 'login.dart';

class TestPage extends StatefulWidget {
  static const String id = '/testpage';
  const TestPage({Key? key}) : super(key: key);
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _picker = ImagePicker();
  File? imagenPath;
  XFile? pickedFile;

  TextEditingController _controller_nombre_producto =
      TextEditingController(text: null);
  TextEditingController _controller_marca = TextEditingController();
  TextEditingController _controller_contenido = TextEditingController();
  TextEditingController _controller_medida_id = TextEditingController();
  TextEditingController _controller_porciento_de_iva = TextEditingController();

  // TextEditingController _controller_categoria_id = TextEditingController();
  TextEditingController _controller_oferta_id = TextEditingController();
  TextEditingController _controller_precio_ahora = TextEditingController();
  TextEditingController _controller_precio_anterior = TextEditingController();
  TextEditingController _controller_descuento = TextEditingController();
  TextEditingController _controller_ahorraste = TextEditingController();
  TextEditingController _controller_descripcion_corto = TextEditingController();
  TextEditingController _controller_mas_detalles = TextEditingController();

  Future chooseImage() async {
    pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile == null) {
        return print('No image selected');
      } else {
        imagenPath = File(pickedFile!.path);
      }
    });
    return pickedFile;
  }

  Future<http.StreamedResponse?> subirAproductos(String token) async {
    var request = http.MultipartRequest('POST',
        Uri.parse('http://192.168.1.22/api_v_1/public/admin/subirAProductos'));

    if (pickedFile != null) {
      Uint8List data = await pickedFile!.readAsBytes();
      List<int> list = data.cast();

      // request.files.add(await http.MultipartFile.fromBytes(
      //     'foto_producto', list,
      //   filename: pickedFile!.path));
      request.files.add(
          await http.MultipartFile.fromPath('foto_producto', pickedFile!.path));

      // request.files.add(
      //      await http.MultipartFile.fromPath('foto_producto', pickedFile!.path));

      //sending headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      });

      request.fields['nombre_producto'] = _controller_nombre_producto.text;
      request.fields['marca'] = _controller_marca.text;
      request.fields['contenido'] = _controller_contenido.text;
      request.fields['medida_id'] = _controller_medida_id.text;
      request.fields['porciento_de_iva'] = _controller_porciento_de_iva.text;

      request.fields['categoria_id'] =
          categoyIdvalue == null ? '' : categoyIdvalue!;
      request.fields['oferta_id'] =
          ofertaIdvalue == null ? '' : categoyIdvalue!;
      request.fields['medida_id'] =
          medidaIdvalue == null ? '' : categoyIdvalue!;

      request.fields['precio_ahora'] = _controller_precio_ahora.text;
      request.fields['precio_anterior'] = _controller_precio_anterior.text;
      request.fields['descuento'] = _controller_descuento.text;
      request.fields['ahorro'] = _controller_ahorraste.text;
      request.fields['descripcion_corto'] = _controller_descripcion_corto.text;
      request.fields['mas_detalles'] = _controller_mas_detalles.text;
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      print(' responde body >>>>>>${response.body}');
      print(' responde body =========>>>>>>>>>${response.statusCode}');

      return streamedResponse;
    }
  }

  String varnull = '';

  // Future<List<String>>
  postCategorias(String token) async {
    Uri url =
        Uri.parse('http://192.168.1.22/api_v_1/public/admin/postcategorias');

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    Map<String, String> body = {
      'nombre_categoria': varnull,
    };

    http.Response response =
        await http.post(url, headers: header, body: jsonEncode(body));
    var data = jsonDecode(response.body);

    print(data);

    return data;
  }

  String? categoyIdvalue;

  String? medidaIdvalue;

  String? ofertaIdvalue;

//==========++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++override+++++++++++++++++++

  @override
  Widget build(BuildContext context) {
    context.read<ProviderTwo>().bringproductos();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{
           context.read<ProviderTwo>().initialValues();
          await context.read<ProviderTwo>().bringproductos();
        },
        child: Center(
          child: Consumer<ProviderTwo>(builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text('OPs Something went wrong ${value.errorMessage}')
                    :  ListView.builder(
                         itemCount: value.map['categorias'].length,
                        itemBuilder: (context, int index) {
                          // return Text('${value.map['categorias'][index]['id']}');
                          return ProductoCard(
                            map: value.map['categorias'][index],
                          );
                        });
          }),
        ),
      ),
    );
  }
}



class ProductoCard extends StatelessWidget {
  const ProductoCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
             // child: Image.network("${map['foto_producto']}"),
              child: Text("${map['nombre_categoria']}"),
            ),
          ],
        ),
      ),
    );
  }
}



























//         return SafeArea(
//         child: Scaffold(
//
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//
//                 children: [
//
//
//
//
//
//
//
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
//                      children: [
//
//
//                      imagenPath == null
//                          ? ClipRRect(
//                        borderRadius: BorderRadius.circular(20.0),
//                        child: Container(
//                          color: Colors.grey,
//                          width: 60,
//                          height: 60,
//                          child: Icon(Icons.account_circle_outlined),
//                        ),
//                      )
//                          : Container(
//                          child: ClipRRect(
//                              borderRadius: BorderRadius.circular(20.0),
//                              child: Image.file(
//                                imagenPath!,
//                                width: 60,
//                                height: 60,
//                              ))),
//
//
//                      TextButton(
//                        style: TextButton.styleFrom(
//                            primary: Colors.black,
//
//                            textStyle: TextStyle( color: Colors.blue,
//                                fontSize: 14,fontWeight: FontWeight.bold),),
//                        onPressed: () {
//                          chooseImage();
//                        },
//                        child: Text('Selecciona un imagen'),
//                      ),
//
//
//                    ],
//
//                    ),
//                  ),
//
//
//
//
//
//
//
//
//                   SizedBox(
//                     height: 20,
//                   ),
//
//
//
//
// //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=categorias++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// //                   Container(
// //
// //                     decoration: BoxDecoration(
// //                       border: Border.all(width: 2,color: Colors.blue),
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     padding: EdgeInsets.only(left: 15, right: 15, top: 5),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: <Widget>[
// //                         Expanded(
// //                           child: DropdownButtonHideUnderline(
// //                             child: ButtonTheme(
// //                               alignedDropdown: true,
// //                               child: DropdownButton<String>(
// //                                 // value:value,
// //                                 iconSize: 30,
// //                                 icon: (null),
// //                                 style: TextStyle(
// //                                   color: Colors.black54,
// //                                   fontSize: 16,
// //                                 ),
// //                                 hint: Text('Select a category'),
// //                                 value: categoyIdvalue,
// //                                 onChanged: (val)=> {
// //                                   categoyIdvalue = val!,
// //                                   print(' Category ID value ${categoyIdvalue}'),
// //                                   setState(() {
// //
// //                                   }),
// //                                 },
// //                                 items:provider.response['categorias'].map<DropdownMenuItem<String>>((e) {
// //                                   return  DropdownMenuItem(
// //                                     child:  Text('${e['nombre_categoria']}'),
// //                                     value: '${e['id']}',
// //                                     // child: new Text('${e.name}'),
// //                                     // value: '${e.id}',
// //                                   );
// //                                 }).toList(),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         IconButton(
// //                           icon: Icon(
// //                             Icons.add,
// //                           ),
// //
// //                           iconSize: 20,
// //                           color: Colors.green,
// //                           // splashColor: Colors.purple,
// //                           onPressed: () async {
// //
// //                             // await provider.getspTokenFromProvideOne();
// //                             // String? token =  await provider.spToken;
// //                             // await postCategorias( token ?? 'empty');
// //                           },
// //                         ),
// //
// //                       ],
// //                     ),
// //                   ),
// //
// //
// //
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //
// //
// //
// //
// //
// //
// //
// // //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ofertas ++++++++++++++++++++++++++++++++++++++++++
// //
// //                   Container(
// //
// //                     decoration: BoxDecoration(
// //                       border: Border.all(width: 2,color: Colors.blue),
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     padding: EdgeInsets.only(left: 15, right: 15, top: 5),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: <Widget>[
// //                         Expanded(
// //                           child: DropdownButtonHideUnderline(
// //                             child: ButtonTheme(
// //                               alignedDropdown: true,
// //                               child: DropdownButton<String>(
// //                                 // value:value,
// //                                 iconSize: 30,
// //                                 icon: (null),
// //                                 style: TextStyle(
// //                                   color: Colors.black54,
// //                                   fontSize: 16,
// //                                 ),
// //                                 hint: Text('Select an offer  unit'),
// //                                  value: ofertaIdvalue,
// //                                 onChanged: (val)=> {
// //                                    ofertaIdvalue = val!,
// //                                   print(' measure unit ${ofertaIdvalue}'),
// //                                   setState(() {
// //
// //                                 }),
// //                                 },
// //                                 items:provider.response['ofertas'].map<DropdownMenuItem<String>>((e) {
// //                                   return new DropdownMenuItem(
// //                                     child: new Text('${e['oferta']}'),
// //                                     value: '${e['id']}',
// //                                     // child: new Text('${e.name}'),
// //                                     // value: '${e.id}',
// //                                   );
// //                                 }).toList(),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         IconButton(
// //                           icon: Icon(
// //                             Icons.add,
// //                           ),
// //
// //                           iconSize: 20,
// //                           color: Colors.green,
// //                           // splashColor: Colors.purple,
// //                           onPressed: () async {
// //
// //                             await provider.getspTokenFromProvideOne();
// //                             String? token =  await provider.spToken;
// //                              await postCategorias( token ?? 'empty');
// //                           },
// //                         ),
// //
// //                       ],
// //                     ),
// //                   ),
// //
// //
// //
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //
// //
// //
// //
// //
// //
// //
// // //+++++++++++++++++++++++++++++++++++++++++++++++++++++++medidas+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// //
// //
// //                   Container(
// //
// //                     decoration: BoxDecoration(
// //                       border: Border.all(width: 2,color: Colors.blue),
// //                       borderRadius: BorderRadius.circular(10),
// //                     ),
// //                     padding: EdgeInsets.only(left: 15, right: 15, top: 5),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: <Widget>[
// //                         Expanded(
// //
//
//
//
//                              child: DropdownButtonHideUnderline(
// //                             child: ButtonTheme(
// //                               alignedDropdown: true,
// //                               child: DropdownButton<String>(
// //                                 // value:value,
// //                                 iconSize: 30,
// //                                 icon: (null),
// //                                 style: TextStyle(
// //                                   color: Colors.black54,
// //                                   fontSize: 16,
// //                                 ),
// //                                 hint: Text('Select a measure unit'),
// //                                  value: medidaIdvalue,
// //                                 onChanged: (val)=> {
// //                                    medidaIdvalue = val!,
// //                                   print(' measure unit ${medidaIdvalue}'),
// //                                   setState(() {
// //
// //                                 }),
// //                                 },
// //                                 items:provider.response['medidas'].map<DropdownMenuItem<String>>((e) {
// //                                   return new DropdownMenuItem(
// //                                     child: new Text('${e['medida']}'),
// //                                     value: '${e['id']}',
// //                                     // child: new Text('${e.name}'),
// //                                     // value: '${e.id}',
// //                                   );
// //                                 }).toList(),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         IconButton(
// //                           icon: Icon(
// //                             Icons.add,
// //                           ),
// //
// //                           iconSize: 20,
// //                           color: Colors.green,
// //                           // splashColor: Colors.purple,
// //                           onPressed: () async {
// //
// //                             await provider.getspTokenFromProvideOne();
// //                             String? token =  await provider.spToken;
// //                              await postCategorias( token ?? 'empty');
// //                           },
// //                         ),
// //
// //                       ],
// //                     ),
// //                   ),
// //
// //
// //
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
//
//
//
//
//
//
//
//
//
//
//                   //
//                   // SizedBox(
//                   //   height: 20,
//                   // ),
//                   //
//                   //
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_nombre_producto,
//                     decoration: InputDecoration(
//                         labelText: 'Nombre ',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()
//                     ),
//
//
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_marca,
//                     decoration: InputDecoration(
//                         labelText: 'Marca',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_contenido,
//                     decoration: InputDecoration(
//                         labelText: 'Contenido',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   TextField(
//                     controller: _controller_medida_id,
//                     decoration: InputDecoration(
//                         labelText: 'Unidad de la medida',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_porciento_de_iva,
//                     decoration: InputDecoration(
//                         labelText: 'Porcentage de IVA',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_oferta_id,
//                     decoration: InputDecoration(
//                         labelText: 'Oferta',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   TextField(
//                     controller: _controller_precio_ahora,
//                     decoration: InputDecoration(
//                         labelText: 'Precio',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_precio_anterior,
//                     decoration: InputDecoration(
//                         labelText: 'Precio anterior',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextField(
//                     controller: _controller_descuento,
//                     decoration: InputDecoration(
//                         labelText: 'Descuento',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   TextField(
//                     controller: _controller_ahorraste,
//                     decoration: InputDecoration(
//                         labelText: 'Ahorraste',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   // request.fields['descripcion_corto'] = _productNameController.text;
//                   // request.fields['mas_detalles'] = _productNameController.text;
//                   //
//
//                   TextField(
//                     controller: _controller_descripcion_corto,
//                     decoration: InputDecoration(
//                         labelText: 'Descripcion',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   TextField(
//                     controller: _controller_mas_detalles,
//                     decoration: InputDecoration(
//                         labelText: 'Detalles',
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(width: 2, color: Colors.blue),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         focusedBorder: OutlineInputBorder()),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//
//                   TextButton(
//                       style: TextButton.styleFrom(
//                           primary: Colors.purple,
//                           backgroundColor: Colors.amberAccent,
//                           textStyle: TextStyle(
//                               fontSize: 20, fontStyle: FontStyle.italic)),
//                       onPressed: () async {
//
//
//
//
//
//
//                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                         String? spToken  = await prefs.getString('spToken');
//                         print  ('sptoken ========================$spToken');
//
//
//
//                         // await provider.getspTokenFromProvideOne();
//                         // String? token = provider.spToken;
//
//
//
//
//
//
//
//                         // request.fields['oferta_id'] = _controller_oferta_id.text;
//                         // request.fields['precio_ahora'] = _controller_precio_ahora.text;
//                         // request.fields['precio_anterior'] = _controller_precio_anterior.text;
//                         // request.fields['descuento'] = _controller_descuento.text;
//                         // request.fields['ahorro'] =_controller_ahorraste.text;
//                         // request.fields['descripcion_corto'] = _controller_descripcion_corto.text;
//                         // request.fields['mas_detalles'] = _controller_mas_detalles.text;
//                         //
//                         //
//
//
//                         //
//                         // print (' foto ==================${_controller_nombre_producto.text}');
//                         //
//                         // print (' _controller_nombre_producto.text ==================${_controller_nombre_producto.text}');
//                         // print (' _controller_marca.text ==================${_controller_marca.text}');
//                         // print ('  _controller_contenido.text ==================${ _controller_contenido.text}');
//                         // print ('_controller_medida_id.text ==================${_controller_medida_id.text}');
//                         // print ('_controller_porciento_de_iva.text ==================${_controller_porciento_de_iva.text}');
//                         // print (' CategoyIdvalue  ==================${categoyIdvalue }');
//                         // print (' _controller_oferta_id.text ==================${ _controller_oferta_id.text}');
//                         // print (' _controller_precio_ahora.text ==================${_controller_precio_ahora.text}');
//                         // print (' _controller_precio_anterior.text ==================${_controller_precio_anterior.text}');
//                         // print (' _controller_descuento.text ==================${_controller_descuento.text}');
//                         // print (' _controller_descripcion_corto.text ==================${_controller_descripcion_corto.text}');
//                         // print (' _controller_ahorraste.text ==================${_controller_mas_detalles.text}');
//                         // print (' _controller_ahorraste.text ==================${_controller_ahorraste.text}');
//
//                          // await subirAproductos(token ?? 'empty');
//
//
//
//                       },
//                       child: Text('Send '))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//   }
//

//
// Center(
// child: TextButton(
// onPressed: () async {
//
// final provider = Provider.of<ProviderTwo>(context,listen: false);
// await  provider.bringproductos();
// Map<String,dynamic> fuck = await  provider.map;
// print (' fuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuck $fuck');
//
//
//
// },
// child: Text('Click'),
// ),
// ),
