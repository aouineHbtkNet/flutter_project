import 'package:flutter/cupertino.dart';

class Producto {
  int id;
  String foto_producto;
  String nombre_producto;
  String marca;
  double contenido;
  double porciento_de_iva;
   int oferta_id;
  double precio_ahora;
  double precio_anterior;
 double descuento;
  double ahorro;
  String descripcion_corto;
  String mas_detalles;
  String categoria;
  String medida;
  String  oferta;



  Producto({
    required this.id,
   required this.foto_producto,
    required this.nombre_producto,
    required this.marca,
    required this.contenido,
    required this.porciento_de_iva,
    required this.oferta_id,
    required this.precio_ahora,
    required this.precio_anterior,
    required this.descuento,
    required this.ahorro,
    required this.descripcion_corto,
    required this.mas_detalles,
    required this.categoria,
    required this.medida,
    required this.oferta,
  });


  factory Producto.fromJson(Map <String, dynamic> json) {

   return Producto(id: json["id"],
       foto_producto: json["foto_producto"] ,
       nombre_producto:  json["nombre_producto"],
       marca:  json["marca"],
       contenido:  json["contenido"],
       porciento_de_iva: json["porciento_de_iva"],
       oferta_id:  json["oferta_id"],
       precio_ahora:  json["precio_ahora"],
       precio_anterior:  json["precio_anterior"],
       descuento:  json["descuento"],
       ahorro:  json["ahorro"],
       descripcion_corto:  json["descripcion_corto"],
       mas_detalles:  json["mas_detalles"],
       categoria:  json["categoria"],
       medida:  json["medida"],
       oferta:  json["oferta"]);



  }






}