import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:simo_v_7_0_1/apis/apisForModals.dart';
import 'package:simo_v_7_0_1/modals/admin_login_response_model.dart';
import 'package:simo_v_7_0_1/modals/productoResponseModel.dart';
import 'package:simo_v_7_0_1/providers/providerProductos.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'addNewcategory.dart';
import 'displayProducts.dart';
import 'login.dart';
import 'package:simo_v_7_0_1/uploadingImagesAndproducts.dart';

class AddProduct extends StatefulWidget {
  static const String id = '/HomeForUser';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final scaffoldKeyUnique = GlobalKey<ScaffoldState>();


  //notification alert widget
 void showstuff(context,String mynotification){
 showDialog(context: context, builder: (context){
  return AlertDialog(
    title: Text('Notification'),
    content: Text(mynotification),
    actions: [
      ElevatedButton(onPressed: (){ Navigator.of(context).pop();}, child: Text('Ok'))
    ],
  );


});

}

//ImagePicker
  File? imageFile;


  void pickupImage(ImageSource source) async {
    try {
      final imageFile = await ImagePicker().pickImage(source: source);

      if (imageFile == null) return;
      final imageTemporary = File(imageFile.path);
      setState(() {
        this.imageFile = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('failed to pick up the image :$e');
    }
  }

  //Sheet function

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo_camera_outlined),
                title: new Text('Camera'),
                onTap: () {
                  pickupImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.photo_library_outlined),
                title: new Text('Galeria'),
                onTap: () {
                  pickupImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }


  List taxTypest = ['IVA', 'Impoconsumo','Exento'];
  List yesNoList = [' SI ', ' NO '];

  final _formKey = GlobalKey<FormState>();

//=================================================================================================================================================




  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _marcaFocusNode = FocusNode();
  final FocusNode _contenidoFocusNode = FocusNode();
  final FocusNode _porcientoDeIvaPriceFocusNode = FocusNode();
  final FocusNode _precioAhoraFocusNode = FocusNode();
  final FocusNode _precioAnteriorFocusNode = FocusNode();
  final FocusNode _porcientoDeDescuentoFocusNode = FocusNode();
  final FocusNode _descripcionFocusNode = FocusNode();

  _nextFocus(FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);



  }

  String? selectedCategory ;
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _marcaController = TextEditingController();
  final TextEditingController _contonidoController = TextEditingController();

  final TextEditingController _precioAhoraController = TextEditingController(text: '0');
  String? selectedTaxType;
  String? selectedDiscuento ;
  final TextEditingController _precioAnteriorController = TextEditingController(text: '0');

  final TextEditingController _typoImpuestoController = TextEditingController();
  final TextEditingController _porcientoImpuestoController = TextEditingController(text: '0');
  final TextEditingController _valorImpuestoontroller = TextEditingController(text: '0');


  final TextEditingController _descripcionController = TextEditingController();




// calculating the percentage of descount
  double calculateDiscount(precioAhora,precioAnterior ){
    return  ((precioAnterior-precioAhora)/precioAnterior)*100;
  }

// calculating the value of the tax in currency

  double value_of_tax(precioAhora,percentageOfTax ){
    return precioAhora * (percentageOfTax/100);


  }
  // calculating the value of price without tax added in currency
  double value_price_with_no_tax(precioAhora,resultOfFunctionvalueOfTaxInCurrency ){
    return precioAhora -resultOfFunctionvalueOfTaxInCurrency;
  }








    Widget buildImageContainer() {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 120,
            height: 120,
            child: imageFile != null
                ? ClipOval(
                    child: Image.file(
                      imageFile!,
                      fit: BoxFit.fill,
                    ),
                  )
                : ClipOval(
                    child: Container(
                        child: Image.asset('assets/profile.png',
                            fit: BoxFit.fill)),
                  ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showPicker(context);
          },
          child: ClipOval(
              child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.green,
                  child: Image.asset('assets/edit.png', fit: BoxFit.fill))),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<ProviderTwo>().bringproductos();
    return Scaffold(
      key: scaffoldKeyUnique,
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        centerTitle: true,
      ),
      body: Consumer<ProviderTwo>(builder: (context, value, child) {
        return value.map.isEmpty && !value.error
            ? Center(child: CircularProgressIndicator())
            : value.error
                ? Text('OPs Something went wrong ${value.errorMessage}')
                : Form(
                    key: _formKey,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Center(child: buildImageContainer()),
                        SizedBox(
                          height: 20,
                        ),

                        // =========First bundle==================1.1=== category name =variabl  $selectedCategory================


                        value.map['categorias'].length==0?Center(child: Text('No hay categorias',style: TextStyle(fontSize: 20,color: Colors.red),)):
                        DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Escoger la categoria',
                              label: Text('Categoria',style: TextStyle(fontSize: 20,color: Colors.blue),),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),


                            value: selectedCategory,//obligatory parameter

                            onChanged: ( value) {     //obligatory parameter
                              selectedCategory = value!;

                              setState(() {});


                            },
                            items: value.map['categorias']  //obligatory parameter
                                .map<DropdownMenuItem<String>>((value) =>
                                    DropdownMenuItem<String>(
                                      value: value["id"].toString(),
                                      child: Text(value["nombre_categoria"].toString()),
                                    ))
                                .toList()),

                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            IconButton(
                              icon: Image.asset('assets/addicon.png'),
                              // Icon(Icons.add),
                              color: Colors.lightGreen,
                              iconSize: 36,

                              onPressed: () {
                                Navigator.pushNamed(context, AddNewCategoryFormScreen.id);
                               },
                            ),

                            Text('Anadir una categoria nueva')
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        // =========================First bundle==================1.2=== product name ====================================

                        TextFormField(
                          keyboardType: TextInputType.name,

                          textInputAction: TextInputAction.next,

                          focusNode: _nombreFocusNode,
                          onFieldSubmitted: (value) {
                            _nextFocus(_marcaFocusNode);
                            setState(() {
                              _nombreController.text = value;
                            });
                          },
                          controller: _nombreController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Obligatorio';
                            } else if (value.length > 26) {
                              return "elnombre es largo";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(

                            hintText: 'Entra el nombre',
                            label: Text('Nombre',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        // =========================First bundle==================1.3=== marcaname ====================================

                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          focusNode: _marcaFocusNode,
                          onFieldSubmitted: (String value) {
                            _nextFocus(_contenidoFocusNode);
                            setState(() {
                              _marcaController.text = value;
                            });
                          },
                          controller: _marcaController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: ' Marca ',
                            label: Text('Marca',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

// =========================First bundle==================1.4=== contenido ====================================

                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          focusNode: _contenidoFocusNode,
                          onFieldSubmitted: (String value) {
                            _nextFocus(_porcientoDeIvaPriceFocusNode);
                            setState(() {
                              _contonidoController.text = value;
                            });
                          },
                          controller: _contonidoController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Contenido ',
                            label: Text('Contenido',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),


                        //
                        //     final TextEditingController _typoImpuestoController = TextEditingController();
                        // final TextEditingController _porcientoImpuestoController = TextEditingController(text: '0');
                        // final TextEditingController _valorImpuestoontroller = TextEditingController(text: '0');
                        //

                        // ===========================================1.5.1=== The New 2  TEXtFORMS ====================================

                        DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Typo de Impuesto ? ',
                              label: Text('Typo de Impuesto',style: TextStyle(fontSize: 20,color: Colors.blue),),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            value:selectedTaxType,//obligatory value
                            onChanged: (value) {
                              setState(() {
                                selectedTaxType = value!;
                              });

                              print(' SELECTED VALUE : ${selectedTaxType}');
                            },
                            items:taxTypest.map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(value.toString()),
                                ))
                                .toList()),

                        SizedBox(
                          height: 20,
                        ),




                        // ===========================================1.5 2=== _porcientoImpuestoController  ====================================

                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (String value) {
                            setState(() {
                              _porcientoImpuestoController.text = value;
                            });
                          },
                          controller: _porcientoImpuestoController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Porciento de impuesto',
                            label: Text('Porciento de impuesto',style: TextStyle(fontSize: 22,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),





//========================== 1.6   precio ahora ===========================================================

                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          focusNode: _precioAhoraFocusNode,
                          onFieldSubmitted: (String value) {
                            // _nextFocus(_precioAhoraFocusNode);
                            setState(() {
                              _precioAhoraController.text = value;
                            });
                          },
                          controller: _precioAhoraController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Precio Ahora',
                            label: Text('Precio Ahora',style: TextStyle(fontSize: 20,color: Colors.blue),),



                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

//=================================== 1.7 hay descuento ==========================================

                        DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: 'Hay Discuento ? ',
                              label: Text('Descuento',style: TextStyle(fontSize: 20,color: Colors.blue),),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            value: selectedDiscuento,//obligatory value
                            onChanged: (value) {
                              setState(() {
                                selectedDiscuento = value!;
                              });

                              print(' SELECTED VALUE : ${selectedDiscuento}');
                            },
                            items: yesNoList.map<DropdownMenuItem<String>>(
                                    (value) => DropdownMenuItem<String>(
                                          value: value.toString(),
                                          child: Text(value.toString()),
                                        ))
                                .toList()),


                        SizedBox(
                          height: 20,
                        ),




                        //=========================== second bundle 1.8 ==== precio anterior===========================

                        selectedDiscuento==' NO '||selectedDiscuento==null?Text(''):TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          focusNode: _precioAnteriorFocusNode,
                          onFieldSubmitted: (String value) {
                            _nextFocus(_descripcionFocusNode);
                            setState(() {
                              _precioAnteriorController.text = value;
                            });
                          },
                          controller: _precioAnteriorController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Precio Anterior ',
                            label: Text('Precio Anterior',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

// =====================Second bundle===========================  1.9  ================= description======================

                        TextFormField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          focusNode: _descripcionFocusNode,
                          onFieldSubmitted: (String value) {
                            setState(() {
                              _descripcionController.text = value;
                            });
                          },
                          controller: _descripcionController,
                          validator: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Descripcion ',
                            label: Text('Descripcion',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        //====================================Button =========================================

                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {

                              double calculatedDiscountPercentage= 0;

                              if (   double.parse(_precioAhoraController.text) > 0
                                     &&
                                     double.parse(_precioAnteriorController.text)>0
                                     &&
                                     double.parse(_precioAhoraController.text) < double.parse(_precioAnteriorController.text) ){

                                calculatedDiscountPercentage =
                                    calculateDiscount(double.parse(_precioAhoraController.text),
                                        double.parse(_precioAnteriorController.text) );
                              } else { calculatedDiscountPercentage= 0; }

                              print(' calculatedDiscountPercentage ====================================$calculatedDiscountPercentage');



                              double Taxvalue =0;

                              if (   double.parse(_precioAhoraController.text)  > 0
                                  &&
                                  double.parse(_precioAhoraController.text)  !=null
                                  &&
                                  double.parse(_porcientoImpuestoController.text) >0
                                  &&
                                  double.parse(_porcientoImpuestoController.text)  !=null
                                  &&
                                  double.parse(_porcientoImpuestoController.text) < 900
                              )

                              {

                                Taxvalue  = value_of_tax(double.parse(_precioAhoraController.text),double.parse(_porcientoImpuestoController.text) );
                              } else
                              { Taxvalue=0;}


                              double  price_with_no_tax =0;

                              if (   double.parse(_precioAhoraController.text)  > 0
                                  &&
                                  double.parse(_precioAhoraController.text)  !=null )
                              {
                                price_with_no_tax = value_price_with_no_tax(double.parse(_precioAhoraController.text),Taxvalue);
                              } else {
                                price_with_no_tax =0;

                              }


                              if(imageFile!=null)
                              { String message   = await ProductUploadingAndDispalyingFunctions().uploadANewProductWithAnImage(
                                  imageFile!,
                                  selectedCategory == null ? '' : selectedCategory!,
                                  _nombreController.text,
                                  _marcaController.text,
                                  _contonidoController.text,
                                  price_with_no_tax.toString(),
                                  selectedTaxType  == null ? '' : selectedCategory!,
                                  _porcientoImpuestoController.text,
                                  Taxvalue.toString(),//valordeimpusto
                                  _precioAhoraController.text,
                                  selectedDiscuento == null ? 'no' : selectedDiscuento!,
                                  _precioAnteriorController.text,
                                  calculatedDiscountPercentage.toString(),
                                  _descripcionController.text);
                              showstuff(context,message);



                              } else{



                                String message   =
                                await ProductUploadingAndDispalyingFunctions().
                                uploadANewProductWithoutImage(

                                    selectedCategory == null ? '' : selectedCategory!,
                                    _nombreController.text,
                                    _marcaController.text,
                                    _contonidoController.text,
                                    selectedTaxType  == null ? '' : selectedCategory!,
                                    _porcientoImpuestoController.text,
                                    Taxvalue.toString(),//valordeimpusto
                                    _precioAhoraController.text,
                                    price_with_no_tax.toString(),
                                    selectedDiscuento == null ? 'no' : selectedDiscuento!,
                                    _precioAnteriorController.text,
                                    calculatedDiscountPercentage.toString(),
                                    _descripcionController.text);

                              showstuff(context,message);}








                            }


                          },
                          child: Text('Enviar '),
                        ),
                      ],
                    ),
                  );
      }),
    );
  }
}
