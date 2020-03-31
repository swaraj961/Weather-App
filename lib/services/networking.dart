import 'package:http/http.dart' as http ;
import 'dart:convert';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getdata()async{
     http.Response response = await http.get(url);
if(response.statusCode == 200){  //all set successful got the data

  String data = response.body; //to store  the json data 
  //temp condition and name print challenge (fetching of data)
  var decodedata = jsonDecode(data);
  return decodedata;

  
} else {
  print(response.statusCode);  
}

  }
}