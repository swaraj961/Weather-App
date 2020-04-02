import 'package:flutter/material.dart';
import 'package:weatherapp/screens/city_screen.dart';
import 'package:weatherapp/utilities/constants.dart';
import 'package:weatherapp/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationweather);
  final locationweather; // basiclly pass the data to a another screen widget  local to state 

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  
  int  temprature;
  String weathericon;
  String cityname;
  String weathermsg;

  WeatherModel w1 = WeatherModel();

  
  @override
  void initState() {
    super.initState();
    updateui(widget.locationweather);
  }

  void updateui( var weatherdata) {
 setState(() {
      if (weatherdata == null) {
        temprature = 0;
        weathericon = 'Error';
        weathermsg = 'cant fetch data';
        cityname = '';
        return;
      }
double temp = weatherdata['main']['temp'];

    temprature = temp.toInt();
      var condition = weatherdata['weather'][0]['id'];
      weathericon = w1.getWeatherIcon(condition);
      weathermsg = w1.getMessage(temprature);
      cityname = weatherdata['name'];
    });
    
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                     var weatherdata = w1.getweatherlocation();
                     updateui(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var typedcityname =  await Navigator.push(context,MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                    if(cityname != null) {
var weatherdata = await w1.getcityname(typedcityname);
updateui(weatherdata);
                    }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature℃',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathericon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weathermsg time in  $cityname",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
