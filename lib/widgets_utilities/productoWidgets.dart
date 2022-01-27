import 'package:flutter/material.dart';




class ItemsInListWithCards extends StatelessWidget {
  const ItemsInListWithCards({Key? key, required this.map, required this.map2})
      : super(key: key);

  final map;
  final map2;

  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.lightGreenAccent,
      width: MediaQuery.of(context).size.width * 0.94,
      child: Container
        (
        child: Column(
            children: [
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/texture100.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    )
    ]
        )
    )
    );



  }
}




//
//
//
//
//
//
// child: Column(
//
//
//
// children: [
// Container(
// height: 26,
//
// child: Card(
// elevation: 16,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(
// '  ${map['precio_ahora']} \$ ',
// style: TextStyle(
// fontSize: 18,
// color: Colors.black,
// fontWeight: FontWeight.bold),
// ),
//
//
// Text.rich(TextSpan(
// text: '${map['precio_anterior']}\$ ',
// style: TextStyle(
// decoration: TextDecoration.lineThrough,
// color: Colors.red))),
//
//
// ],
// ),
// ),
// ),
//
//
//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: <Widget>[
// Stack(
// children: [
//
// Container(
// width: MediaQuery.of(context).size.width * 0.28,
// height: 100.0,
// child: Card(
// elevation: 10,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(8.0),
// child: Image.network('${map['foto_producto']}',
// fit: BoxFit.fill),
// ),
// ),
// ),
// Container(
// child:Column(
// children: [
//
// Text(
// 'DESCUENTO',
// style: TextStyle(
// fontSize: 18,
//
// color: Colors.black,
// fontWeight: FontWeight.bold),
// ),
//
//
// Row(
// children: [
//
// Positioned(
// top: 4,
// left: 2,
// child: Container(
// height: 20,
// width: 40,
//
// child: Container(
// height: 20,
// width: 20,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// color: Colors.white
// ),
// child: Text(
// '${map['descuento']}',
// style: TextStyle(
// color: Colors.black,
// fontSize: 10,
//
// ),
// ),
// ),
//
//
// ),
// ),
//
// Positioned(
// top: 4,
// left: 20,
// child: Container(
// height: 20,
// width: 20,
//
// child:ClipRRect(
// borderRadius: BorderRadius.circular(8.0),
// child: Image.asset('assets/discountIcon.png',
// fit: BoxFit.fill),
// ),
// ),
// ),
// ],
// ),
//
//
//
// Container(
// width: MediaQuery.of(context).size.width * 0.50,
// // height: MediaQuery.of(context).size.height * 0.16,
// height: 100.0,
// child: Card(
// elevation: 10,
// shadowColor: Colors.black,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: <Widget>[
// Text(
// '${map['nombre_producto']}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 14,
// ),
// ),
// Text(
// '  ${map['marca']}',
// style: TextStyle(
// fontSize: 12,
// ),
// ),
//
// ],
// )
//
// ),
//
// ),
//
//
//
//
// ),
// ],
// ),
// ]
// ),
//
// )
// ),
// ]),













Widget buildDiscountWidget(String precioAnterior, int descuento) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text.rich(TextSpan(
          text: '$precioAnterior\$ ',
          style: TextStyle(
              decoration: TextDecoration.lineThrough, color: Colors.red))),
      Text(
        '${descuento} %  DE DESCUENTO',
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
        ),
      ),
    ],
  );
}

class ObjectCategoria {
  ObjectCategoria({
    required this.id,
    required this.nombreCategoria,
  });
  late final int id;
  late final String nombreCategoria;
  @override
  String toString() {
    return '{ ${this.id}, ${this.nombreCategoria} }';
  }
}
