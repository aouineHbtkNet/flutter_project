
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MercadoPagoWebPage extends StatefulWidget {
  static const String id = '/mercadoPagoWebPage';
  String value;
  MercadoPagoWebPage(this.value);




  @override
  _MercadoPagoWebPageState createState() => _MercadoPagoWebPageState();
}

class _MercadoPagoWebPageState extends State<MercadoPagoWebPage> {




  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }



  Widget build(BuildContext context) {



    return  WebView(
      initialUrl: widget.value,
              // initialUrl: 'https://www.google.com',
            // Enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,

    );
  }
}