import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
class ImageApi {

  Uri _url = Uri.parse('http://10.0.2.2:8000/admin/upload');

postDataImagen(_data) async{

return await http.post(
    _url,
  headers: {
    'Content-Type': 'application/json',
    'Accept':'application/json',
    'Charset':'utf-8',
    'Authorization': 'Bearer 196|nVHqEUmdcNsKuT4hXQpxp6rvotZ6FjH39pE1gesx ',

  },
  body: jsonEncode(_data),




);
}


}