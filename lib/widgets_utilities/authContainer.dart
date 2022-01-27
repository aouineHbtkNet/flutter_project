
import 'package:simo_v_7_0_1/screens/addproducts.dart';
import 'package:simo_v_7_0_1/screens/dash_board_for_admins.dart';
import 'package:simo_v_7_0_1/screens/login.dart';
import 'package:simo_v_7_0_1/screens/testFile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthContaner extends StatefulWidget {
  const AuthContaner({Key? key}) : super(key: key);

  @override
  _AuthContanerState createState() => _AuthContanerState();
}


class _AuthContanerState extends State<AuthContaner> {

bool initial =true;
String accessToken ='empty';

  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((sharedPrefvalue){
        setState(() {
          initial =false;

          accessToken  = sharedPrefvalue.getString('spToken') ?? 'empty';
          print ('  From AuthContainer ===========>  $accessToken');
        });

      });
      return Scaffold(
          body: Center(child: CircularProgressIndicator()));

    }else{

      if( accessToken=='empty')
      { return Login();}
      else
        { return DashBoard();}

    }

  }
}
