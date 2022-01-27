
import 'package:flutter/material.dart';

class SmallCardInsteadTileList extends StatelessWidget {
  static const String id = '/cardsmall';
  const SmallCardInsteadTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
        title: Column(
          children: [
            Text('Your Cart ' ,style: TextStyle(fontSize: 20),),
            Text(' 4 Items  ' ,style: TextStyle(fontSize: 10),)
          ],
        ),


      ),

      body: Row(
        children: [

          SizedBox(
            width:MediaQuery.of(context).size.width*0.30,
            height: MediaQuery.of(context).size.height*0.20,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                  
                ),
                child: Image.asset('assets/texture5.jpg' ,fit: BoxFit.cover,),
              ),
            ),
          ),

          SizedBox(
            width:MediaQuery.of(context).size.width*0.60,
            height: MediaQuery.of(context).size.height*0.20,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),

                ),
                child: Column(
                  children: [
                    Container(
                      width:MediaQuery.of(context).size.width*0.60,
                      height: MediaQuery.of(context).size.height*0.1,
                      color: Colors.greenAccent,
                      child: Row(children: [

                      ],),
                    ),
                    Container(
                      width:MediaQuery.of(context).size.width*0.60,
                      height: MediaQuery.of(context).size.height*0.1,
                      color: Colors.blue,
                      child: Row(children: [

                      ],),
                    )
                  ],
                ),
              ),
            ),
          ),




















        ],


    ),


    );
  }
}