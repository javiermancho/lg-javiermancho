import 'dart:convert';

import 'package:lg_app_t2/connection/Connection.dart';

class FlyTo extends Connection{
   String latitude;
   String longitude;
   String elevation;
   String altitude;
   String tilt;
   String bearing;

   FlyTo({required this.latitude, required this.longitude, required this.altitude, required this.elevation, required this.tilt, required this.bearing});

   @override
   Map<String, dynamic> toJson(){
     return {
       'ip': ip,
       'port': port,
       'username': username,
       'password': password,
       'screens': screens,
       'latitude': latitude,
       'longitude': longitude,
       'altitude': altitude,
       'elevation': elevation,
       'tilt': tilt,
       'bearing': bearing,
     };
   }
   @override
   String toJsonString() {
     return jsonEncode(toJson());
   }
}
