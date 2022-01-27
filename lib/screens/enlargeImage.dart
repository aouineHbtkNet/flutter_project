import 'package:flutter/material.dart';
class EnlargeImage extends StatelessWidget {
  const EnlargeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueGrey,
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.width * 0.90,


      ),
    );
  }
}
