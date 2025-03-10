import 'package:lg_app_t2/connection/Connection.dart';
import 'dart:convert';


class Logo extends Connection {
  final String kml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\n<kml xmlns=\"http://earth.google.com/kml/2.2\">\n\n<ScreenOverlay>\n\n<name>LOGO</name>\n\n<color>ffffffff</color>\n<drawOrder>99</drawOrder>\n<Icon>\n\n<href>https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgXmdNgBTXup6bdWew5RzgCmC9pPb7rK487CpiscWB2S8OlhwFHmeeACHIIjx4B5-Iv-t95mNUx0JhB_oATG3-Tq1gs8Uj0-Xb9Njye6rHtKKsnJQJlzZqJxMDnj_2TXX3eA5x6VSgc8aw/s320-rw/LOGO+LIQUID+GALAXY-sq1000-+OKnoline.png</href>\n\n</Icon>\n\n<overlayXY x=\"0\" y=\"1\" xunits=\"fraction\" yunits=\"fraction\" />\n\n<screenXY x=\"0\" y=\"1\" xunits=\"fraction\" yunits=\"fraction\" />\n\n<rotationXY x=\"0\" y=\"0\" xunits=\"fraction\" yunits=\"fraction\" />\n\n<rotation>0</rotation>\n\n<size x=\"200\" y=\"200\" xunits=\"pixels\" yunits=\"pixels\" />\n\n</ScreenOverlay>\n\n</kml>";


  @override
  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'port': port,
      'username': username,
      'password': password,
      'screens': screens,
      'kml': kml
    };
  }

  @override
  String toJsonString() {
    return jsonEncode(toJson());
  }
}