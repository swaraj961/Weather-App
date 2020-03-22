import 'package:geolocator/geolocator.dart';
class Location{
  Location({this.lattitude, this.longitude});
double lattitude;
double longitude ;

Future<void>getcurrentlocation()async{
 try{
  Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
 lattitude = position.latitude ;
 longitude = position.longitude;
   }
  catch (e){
    print(e);  
     
  }
}

}