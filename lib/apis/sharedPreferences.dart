import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {




  //]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]not sure code  Start

static  late   SharedPreferences _preferences ;

static const _keyUsername = 'username';

// initializing the object

static Future init () async{
  _preferences =  await SharedPreferences.getInstance();
}




static Future setUserName ( String username) async{
  await  _preferences.setString(_keyUsername, username);
}

static String? getUserName() {  return _preferences.getString(_keyUsername);}








//=====================================not sure code End =======










  addTokenToSP( String value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString( 'token',value);
    print( prefs.getString( 'token'));
  }

  addUserNameToSP( String value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString( 'username',value);
    print( prefs.getString( 'username'));
  }

  addUserImageToSP( String value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString( 'userImage',value);
    print( prefs.getString( 'userImage'));
  }

  addUserEmailToSP( String value ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString( 'email',value);
    print( prefs.getString( 'email'));
  }






    Future  getTokenFromSP( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     var   token = prefs.getString( 'token') ;
    print( token);
    return token;
  }


  Future  getuserNameFromSP( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var   userName = prefs.getString(  'username') ;
    print( userName);
    return userName;
  }


  Future  getuserEmailFromSP( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var   email = prefs.getString('email') ;
    print( email);
    return email;
  }

  Future  getuserImageFromSP( ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var   userImage = prefs.getString('userImage') ;
    print( userImage);
    return userImage;
  }












  removeValues( String  key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key );
    return true;

  }

  checkValues( String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey(key);
    return CheckValue;
  }


}

