import 'package:http/http.dart' as http;
import 'package:lg_app_t2/Connection/Connection.dart';
import 'package:lg_app_t2/flyTo/FlyTo.dart';
import 'package:lg_app_t2/flyTo/KMLStadium.dart';
import 'package:lg_app_t2/logo/Logo.dart';

class Controller {
  static Future<String> getData(String url, FlyTo location) async {
    final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: location.toJsonString(),
    );

    if (response.statusCode == 200) {
      return "Going to location...";
    } else {
      return "Error: ${response.statusCode} - ${response.body}";
    }
  }

  static Future<String> reload(String url) async{
    Connection connection = Connection();
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: connection.toJsonString(),
    );
    if (response.statusCode == 200) {
      return "Reloading...";
    } else {
    return "Error: ${response.statusCode} - ${response.body}";
    }
  }

  static Future<String> sendKML(String filename, String url) async{
    KMLStadium stadium = KMLStadium(filename: filename);
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: stadium.toJsonString(),
    );
    if (response.statusCode == 200) {
      return "KML Received";
    } else {
      return "Error: ${response.statusCode} - ${response.body}";
    }
  }

  static Future<String> cleanKML(String url) async{
    Connection connection = Connection();
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: connection.toJsonString(),
    );
    if (response.statusCode == 200) {
      return "KML Cleaned";
    } else {
      return "Error: ${response.statusCode} - ${response.body}";
    }
  }

  static Future<String> manageLogo(String url) async{
    Logo logo = Logo();
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: logo.toJsonString(),
    );
    if (response.statusCode == 200) {
      return "Logo Displayed";
    } else {
      return "Error: ${response.statusCode} - ${response.body}";
    }
  }

}

