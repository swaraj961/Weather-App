import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart' as http ;
import 'package:convert/convert.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
@override
void initState() { 
   super.initState();
 

  getlocation();

  
}
void getlocation () async {
 Location loc = Location();
 await loc.getcurrentlocation();
 print(loc.lattitude);
 print(loc.longitude) ;  
}

void getdata() async {

  http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=239&appid=b6907d289e10d714a6e88b30761fae22');
if(response.statusCode == 200){
  String data = response.body;
  //temp condition and name print challenge (fetching of data)
 var temp = jsonDecode(data) ['main'] ['temp']; 
 print(temp);
  
  var condition = jsonDecode(data)['weather'][0]['id'];
  print(condition);
   var name = jsonDecode(data) ['name'];
   print(name);
  
} else {
  print(response.statusCode);  
}
} 
  @override
  
  Widget build(BuildContext context) {
      getdata();
    return Scaffold( 
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getlocation();
            //Get the current location
          },
          child: Text('Get Location'), 
        ),
      ), 
      
    );
  }
}