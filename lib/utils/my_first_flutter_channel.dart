import 'package:flutter/services.dart';



class MyFirstFlutterChannel{
final MethodChannel _methodChannel = MethodChannel("hbtknet.v_10/channel01");

Future<void >  version() async{

 try{
  final result = await  _methodChannel.invokeMethod("version");
  print(result);
 }catch(e){
  print(e);
 }

}
}