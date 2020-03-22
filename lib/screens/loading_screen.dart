import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
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
 Location l1 = Location();
 await l1.getcurrentlocation();
 print(l1.lattitude);
 print(l1.longitude) ;  
}
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
     /* body: Center(
        child: RaisedButton(
          onPressed: () {
            getlocation();
            //Get the current location
          },
          child: Text('Get Location'), 
        ),
      ), 
      */
    );
  }
}