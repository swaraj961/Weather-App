import 'package:flutter/material.dart';
import 'package:weatherapp/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city-new.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (value) {
                      cityname = value;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        icon: Icon(Icons.location_city, color: Colors.white),
                        hintText: 'Search for the city',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide
                              .none, //remove blue default outline border
                        )),
                  )),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityname);
                },
                
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
