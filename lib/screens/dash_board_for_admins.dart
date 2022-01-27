import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:simo_v_7_0_1/widgets_utilities/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'displayProducts.dart';
import 'inventory.dart';

class DashBoard extends StatefulWidget {
  static const String id = '/ dashboard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          mytext: ''
        ),







      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
          child: GridView.count(
            primary: true,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            shrinkWrap: true,

            children: <Widget>[


              Material(
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)),

                child: InkWell(
                  onTap: () {
                 Navigator.of(context).pushNamed(Inventory.id);
                  },
                  child:  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                       Icon(
                            Icons.shop,
                            size: 50,color: Colors.amber,
                          ),

                        Text(
                              'INVENTORY', style: TextStyle(color: Colors.black,),),



                      ],
                    ),
                  ),
                ),
              ),



              Material(
                // color: Colors.white,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)),

                child: InkWell(
                  onTap: () {
                    print('1 was clicked');
                  },
                  child:  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.access_alarms,
                          size: 50,color: Colors.amber,
                        ),

                        Text(
                          'HOME', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),



                      ],
                    ),
                  ),
                ),
              ),



              Material(
                // color: Colors.white,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)),

                child: InkWell(
                  onTap: () {
                    print('1 was clicked');
                  },
                  child:  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.access_alarms,
                          size: 50,color: Colors.amber,
                        ),

                        Text(
                          'HOME', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),



                      ],
                    ),
                  ),
                ),
              ),



              Material(
                // color: Colors.white,

                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.black)),

                child: InkWell(
                  onTap: () {
                    print('1 was clicked');
                  },
                  child:  Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.access_alarms,
                          size: 50,color: Colors.amber,
                        ),

                        Text(
                          'HOME', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),



                      ],
                    ),
                  ),
                ),
              ),




















   ]
    ),
        )
      )
    );
  }
}
