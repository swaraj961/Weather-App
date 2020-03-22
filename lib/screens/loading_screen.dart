import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:http/http.dart';
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

  Response response = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=239&appid=b6907d289e10d714a6e88b30761fae22');
  print(response.body);
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