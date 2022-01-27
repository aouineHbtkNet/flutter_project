
import 'package:simo_v_7_0_1/modals/cart_model.dart';
import 'package:simo_v_7_0_1/providers/cartWithNoChangeNotifier.dart';
import 'package:simo_v_7_0_1/providers/databaseProvider.dart';
import 'package:simo_v_7_0_1/providers/provider_one.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  static const String id = '/cart';
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<CartWithNoChangeProvider>(context);

    // var recordTotals = providerSecond.permenantLisT.map((e) => e.recordTotal);

    List<CartModel> _list = _provider.itemsInBasket;
    int _count = _provider.count;

    var _name = _list.map((e) => e.name);
    var _foto = _list.map((e) => e.imageUrl);
    var _price = _list.map((e) => e.price);
    var _quantity = _list.map((e) => e.quantity);
    // var _recordTotal = _list.map((e) => e.recordTotal);
    var _recordTotalMultipliedWithquantity = _provider.subtotal;
    // var generalTotal= _list.map((e) => e.recordTotal).reduce((value, element) => value! + element!.toDouble());

    return Scaffold(
        appBar: AppBar(
          title: Text(' '),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(2.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.56,
                decoration: BoxDecoration(
                  // border: Border.all(width: 4, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ListTile(
                              // title: Text(' NAME : ${_list[index].name} '),

                              leading: Image.network('${_list[index].imageUrl}',
                                  fit: BoxFit.cover),
                              title: Text(
                                '    ${_list[index].name}  ${_list[index].price!.toStringAsFixed(2)}\$ ',
                                style: TextStyle(color: Colors.blue),
                              ),
                              subtitle: Text(
                                  ' X  ${_list[index].quantity!.toStringAsFixed(0)}  '
                                  '  TOTAL  :  ${_list[index].recordTotal!.toStringAsFixed(2)} ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),

                              trailing: InkWell(
                                  onTap: () {
                                    _provider.removeFrombasket(_list[index]);
                                  },
                                  child: Icon(Icons.delete)),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(height: 1.0,),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    margin: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                     color: Colors.black38
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ENVIO '),
                              Text(
                                '${_provider.envio!.toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('IVA '),
                              Text(
                                '${_provider.calculatIva().toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('DISCOUNT '),
                              Text(
                                '${_provider.calculateDiscount().toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SUBTOTAL '),
                              Text(
                                '${_recordTotalMultipliedWithquantity.toStringAsFixed(2)} ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('TOTAL '),
                              Text(
                                '${_provider.setTotal().toStringAsFixed(2)}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

// ${DataBaseHelper.instance.cartList.
//                    map((e) => e.recordTotal).reduce((value,
//                        element) =>
//                    value! + element!.toDouble())}

//
//
// body: FutureBuilder<List<CartModel>>(
// future: DataBaseHelper.instance.getCartModel(),
// builder:
// (BuildContext context, AsyncSnapshot<List<CartModel>> snapshot) {
// if (!snapshot.hasData) {
// return Center(child: Text('Loading....'));
// }
//
// return snapshot.data!.isEmpty
// ? Center(child: Text('No DATA in the list'))
//     : Column(
// children: [
//
//
// Container(
// width: MediaQuery
//     .of(context)
//     .size
//     .width,
// height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.70,
// child: ListView.builder(
// itemCount: DataBaseHelper.instance.cartList.length,
// itemBuilder: (BuildContext ctxt, int index) {
// return ListTile(
// leading: Text(
// ' Name : ${DataBaseHelper.instance
//     .cartList[index].recordTotal!} '),
// title: Text(
// ' Price : ${DataBaseHelper.instance
//     .cartList[index].price}'),
// subtitle: Text(
// ' Quantity : ${DataBaseHelper.instance
//     .cartList[index].quantity}  '
// '   Total :    ${DataBaseHelper.instance
//     .cartList[index].recordTotal}             '),
// onTap: () async {
// DataBaseHelper.instance.removingToCarList(
// DataBaseHelper.instance.cartList[index].id!);
// setState(() {});
// },
// );
// }),
// ),
//
//
// Expanded(
// child: Container(
// color: Colors.lightGreenAccent,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(' SUBTOTAL :'),
//
// Text(' ${DataBaseHelper.instance.cartList.
// map((e) => e.recordTotal).reduce((value,
// element) =>
// value! + element!.toDouble())}'),
// ],
// ),
//
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text('TOTAL12 :'),
//
// Text(' ${DataBaseHelper.instance.cartList.
// map((e) => e.recordTotal).reduce((value,
// element) =>
// value! + element!.toDouble())}'),
//
//
//
//
//
// ],
// ),
// ],
// ),
// ),
// ),
//
//
// ],
// );
// },
// ),
