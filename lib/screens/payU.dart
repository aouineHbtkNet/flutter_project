// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_payu_unofficial/flutter_payu_unofficial.dart';
// import 'package:flutter_payu_unofficial/models/payment_params_model.dart';
// import 'package:flutter_payu_unofficial/models/payment_result.dart';
// import 'package:flutter_payu_unofficial/models/payment_status.dart';
// import 'dart:async';
//
// // import 'package:flutter_payu_unofficial_example/credentials.dart';
// // import 'package:flutter_payu_unofficial_example/widgets/common_text_field.dart';
//
//
// class PAyU extends StatefulWidget {
//   static const String id = '/PayU';
//   @override
//   _PAyUState createState() => _PAyUState();
// }
//
// class _PAyUState extends State<PAyU> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   TextEditingController _merchantIDTextFieldController =
//   TextEditingController(text:'957874');
//   TextEditingController _merchantKeyTextFieldController =
//   TextEditingController(text: 'P0XzeB3zO5Ri455pFa710NrJFM');
//   TextEditingController _saltTextFieldController =
//   TextEditingController(text: '12345');
//   TextEditingController _amountTextFieldController =
//   TextEditingController(text: "100");
//   TextEditingController _transactionIDTextFieldController =
//   TextEditingController(
//       text: DateTime.now().millisecondsSinceEpoch.toString());
//   TextEditingController _nameTextFieldController =
//   TextEditingController(text: "Test Name");
//   TextEditingController _productInfoTextFieldController =
//   TextEditingController(text: "Test Product");
//   TextEditingController _emailTextFieldController =
//   TextEditingController(text: "Test@test.com");
//
//   Future<void> pay() async {
//     PaymentParams _paymentParam = PaymentParams(
//       merchantID: _merchantIDTextFieldController.text,
//       merchantKey: _merchantKeyTextFieldController.text,
//       salt: _saltTextFieldController.text,
//       amount: _amountTextFieldController.text,
//       transactionID: _transactionIDTextFieldController.text,
//       firstName: _nameTextFieldController.text,
//       email: _emailTextFieldController.text,
//       productName: _productInfoTextFieldController.text,
//       phone: "9876543210",
//       fURL: "https://www.payumoney.com/mobileapp/payumoney/failure.php",
//       sURL: "https://www.payumoney.com/mobileapp/payumoney/success.php",
//       udf1: "udf1",
//       udf2: "udf2",
//       udf3: "udf3",
//       udf4: "udf4",
//       udf5: "udf5",
//       udf6: "",
//       udf7: "",
//       udf8: "",
//       udf9: "",
//       udf10: "",
//       hash:
//       "", //Hash is required will initialise with empty string now to set actuall hash later
//       isDebug: true, // true for Test Mode, false for Production
//     );
//
//     //Generating local hash
//     var bytes = utf8.encode(
//         "${_paymentParam.merchantKey}|${_paymentParam.transactionID}|${_paymentParam.amount}|${_paymentParam.productName}|${_paymentParam.firstName}|${_paymentParam.email}|udf1|udf2|udf3|udf4|udf5||||||${_paymentParam.salt}");
//     String localHash = sha512.convert(bytes).toString();
//     _paymentParam.hash = localHash;
//
//     try {
//       PayuPaymentResult _paymentResult =
//       await FlutterPayuUnofficial.initiatePayment(
//           paymentParams: _paymentParam, showCompletionScreen: true);
//
//       //Checks for success and prints result
//
//       if (_paymentResult != null) {
//         //_paymentResult.status is String of course. Directly fetched from payU's Payment response. More statuses can be compared manually
//
//         if (_paymentResult.status == PayuPaymentStatus.success) {
//           print("Success: ${_paymentResult.response}");
//         } else if (_paymentResult.status == PayuPaymentStatus.failed) {
//           print("Failed: ${_paymentResult.response}");
//         } else if (_paymentResult.status == PayuPaymentStatus.cancelled) {
//           print("Cancelled by User: ${_paymentResult.response}");
//         } else {
//           print("Response: ${_paymentResult.response}");
//           print("Status: ${_paymentResult.status}");
//         }
//       } else {
//         print("Something's rotten here");
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('PayU Money Example'),
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextField(
//
//
//                   controller: _merchantIDTextFieldController,
//                 ),
//                 TextField(
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Merchant Key'
//                   ),
//                   controller: _merchantKeyTextFieldController,
//                 ),
//                 TextField(
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Merchant Key'
//                   ),
//
//                   controller: _saltTextFieldController,
//                 ),
//                 TextField(
//
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Amount'
//                   ),
//                   controller: _amountTextFieldController,
//                 ),
//                 TextField(
//
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Transaction ID'
//                   ),
//                   controller: _transactionIDTextFieldController,
//                 ),
//                 TextField(
//
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Name'
//                   ),
//                   controller: _nameTextFieldController,
//                 ),
//                 TextField(
//
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Product Info'
//                   ),
//                   controller: _productInfoTextFieldController,
//                 ),
//                 TextField(
//
//                   decoration: new InputDecoration.collapsed(
//                       hintText: 'Email'
//                   ),
//                   controller: _emailTextFieldController,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: RaisedButton(
//                     onPressed: pay,
//                     child: Text("Pay"),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
//}