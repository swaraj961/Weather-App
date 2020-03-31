import 'package:flutter/material.dart';
import 'package:weatherapp/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 //local var
  @override
  void initState() {
    super.initState();

    getlocation();
  }

  void getlocation() async {
  //fetching data
  WeatherModel w1 = WeatherModel();
  var weatherdata = await w1.getweatherlocation();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //to push datainto location screen
      return LocationScreen(weatherdata); 
    }
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
