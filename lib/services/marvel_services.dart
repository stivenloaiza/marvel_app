import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:marvel_ruta_n/configuration.dart' as cg;

class MarvelServices{

  //GET: /api/Payment/startSoatPayment
  //request: params= ?atributo1=atributo&apikey=5bfdaaccb35e714e956317cab76cd42d&hash=ac5735a846871348f3b3390cec0fada5&ts=1
  //response: {data: "url payment"}
  static Future<Map<String, dynamic>> getPersonaje(String params) async{
    Map <String, dynamic> responseData;
    try{
      var url = '${cg.urlApiMarvel}/public/characters?$params';
      var response = await http.get(
          Uri.parse(url),
          headers:{
            'Accept': 'application/json',
          }
      ).timeout(Duration(seconds: 120));
      print('Response status getPersonaje${response.statusCode}');
      if(response.statusCode == 200) {
        responseData= jsonDecode(response.body);
        return responseData;
      }else{
        return null;
      }
    }catch(e)
    {
      print(e);
      return null;
    }
  }

}