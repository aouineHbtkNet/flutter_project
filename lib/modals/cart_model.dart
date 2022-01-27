import 'package:flutter/material.dart';

class CartModel {
  int? id;
  String? imageUrl;
  String? name;
  double? price;
  double? quantity;
  double? recordTotal;

  CartModel({this.id,this.imageUrl, this.name, this.price, this.quantity, this.recordTotal});

  CartModel.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    imageUrl = data['imageUrl'];
    name = data['name'];
    price = data['price'];

    quantity = data['quantity'];
    recordTotal = data['recordTotal'];
  }
  Map<String, dynamic> toMap() => {
        'id': id,
         'imageUrl': imageUrl,
        'name': name,
        'price': price,
        'quantity': quantity,
        'recordTotal': recordTotal,
      };
}
