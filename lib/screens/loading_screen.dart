import 'package:flutter/material.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apikey = '54668cdcac911bf5adbe9d3714990753';

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
    Location loc = Location();
    await loc.getcurrentlocation();
   
  //using package get latt and longi

    NetworkHelper n1 = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${loc.lattitude}&lon=${loc.longitude}&appid=$apikey&units=metric'); // puttedinto url
    var weatherdata = await n1.getdata(); //fetching data
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //to push datainto location screen
      return LocationScreen(weatherdata);
    }));
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
