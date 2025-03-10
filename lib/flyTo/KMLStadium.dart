import 'package:lg_app_t2/connection/Connection.dart';
import 'dart:convert';


class KMLStadium extends Connection{
  String filename;

  KMLStadium({required this.filename});

  @override
  Map<String, dynamic> toJson(){
    return {
      'ip': ip,
      'port': port,
      'username': username,
      'password': password,
      'screens': screens,
      'filename': filename
    };
  }
  @override
  String toJsonString() {
    return jsonEncode(toJson());
  }
}