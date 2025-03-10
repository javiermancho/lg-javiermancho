import 'package:flutter/material.dart';
import 'package:lg_app_t2/connection/Connection.dart';
import 'package:lg_app_t2/flyTo/FlyTo.dart';
import 'package:lg_app_t2/controller/Controller.dart';
import 'package:lg_app_t2/logo/Logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiquidGalaxy Stadium Controller',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const MyHomePage(title: 'STADIUM CONTROLLER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "";

  bool isToggled = false;
  String _metropolitanoFile = "metropolitano.txt";
  String _bernabeuFile = "bernabeu.txt";
  String _campnouFile = "campnou.txt";
  String _sanmamesFile = "sanmames.txt";

  String _baseUrl = "https://cb64-88-1-169-26.ngrok-free.app/api";

  // --------------------- STADIUM OBJECTS ------------------------
  final FlyTo _metropolitano = FlyTo(
      latitude: "40.436320",
      longitude: "-3.600461",
      elevation: "600",
      altitude: "2000",
      tilt: "62",
      bearing: "80");

  final FlyTo _campNou = FlyTo(
      latitude: "41.380550",
      longitude: "2.121725",
      elevation: "600",
      altitude: "2000",
      tilt: "62",
      bearing: "70"
  );

  final FlyTo _bernabeu = FlyTo(
      latitude: "40.452803",
      longitude: "-3.687806",
      elevation: "550",
      altitude: "1000",
      tilt: "75",
      bearing: "95"
  );

  final FlyTo _sanmames = FlyTo(
      latitude: "43.264656",
      longitude: "-2.949485",
      elevation: "550",
      altitude: "1050",
      tilt: "75",
      bearing: "180"
  );

  // --------------------- REQUEST METHODS ------------------------
  Future<void> _sendRequest(FlyTo location, String filename) async{
    await _clean();
    _message = await Controller.getData("$_baseUrl/lg-connection/flyto", location);
    _message = await Controller.sendKML(filename, "$_baseUrl/lg-connection/stadium");
  }

  Future<void> _reload() async{
    _message = await Controller.reload("$_baseUrl/lg-connection/relaunch-lg");
  }

  Future<void> _clean() async{
    _message = await Controller.cleanKML("$_baseUrl/lg-connection/clean-visualization");
  }

  Future<void> _cleanIcons() async{
    _message = await Controller.cleanKML("$_baseUrl/lg-connection/clean-logos");
  }

  Future<void> _displayIcons() async{
    _message = await Controller.manageLogo("$_baseUrl/lg-connection/show-logo");
  }

  // --------------------- POPUPMENU CONTROLLER ------------------------
  void _handleMenuSelection(dynamic value){
    setState(() {
      isToggled= !isToggled;
    });
    if(isToggled){
      _displayIcons();
    }else{
      _cleanIcons();
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00072D),
        actions: [
    // ------------------------------- POPUP MENU --------------------------------
          Theme(
            data: Theme.of(context).copyWith(
              popupMenuTheme: PopupMenuThemeData(
                color: Colors.white.withAlpha(204),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child:PopupMenuButton(
              onSelected: _handleMenuSelection,
              icon: Icon(Icons.settings, size: 30, color: Colors.white),
              itemBuilder: (context)=> [
                PopupMenuItem(
                  enabled: false,
                  child: Center(
                    child:  Text(
                        "Liquid Galaxy Settings",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF00072D)
                        )
                    ),
                  ),
                ),
                PopupMenuItem(
                    value: "toggleAction",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Display Logo"),
                        Icon(
                          isToggled ? Icons.toggle_on : Icons.toggle_off,
                          color: isToggled ? Colors.green : Colors.grey,
                          size: 30,
                        )
                      ],
                    )
                )
              ],
            )
          )
        ],
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'Raleway',
          ),
        ),
        centerTitle: true,
      ),

  // -------------------------- APP ------------------------------
      backgroundColor: Color(0xFF00072D),
        body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

          // ---------------------- HEADER ---------------------------
              Image.asset(
                'assets/liquidGalaxy.png',
                width: 200,
                fit: BoxFit.cover, // Adjusts how the image fits
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Text(
                  "Select Stadium",
                  style:  TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Raleway',
                  ),
              ),

          // ---------------------- TEAM LOGOS ---------------------------
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Wrap(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _sendRequest(_metropolitano, _metropolitanoFile),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child:Image.asset(
                      'assets/atm.png',
                      width: 100,
                    )
                  ),
                  ElevatedButton(
                    onPressed: () => _sendRequest(_campNou, _campnouFile),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child:Image.asset(
                      'assets/fcb.png',
                      width: 100,
                    )
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Wrap(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => _sendRequest(_bernabeu, _bernabeuFile),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent
                    ),
                    child:Image.asset(
                      'assets/rmcf.png',
                      width: 100,

                    )
                  ),
                  ElevatedButton(
                      onPressed: () => _sendRequest(_sanmames, _sanmamesFile),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent
                      ),
                      child:Image.asset(
                        'assets/ath.png',
                        width: 100,
                      )
                  ),
                ]
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Wrap(
                children: <Widget>[
                  ElevatedButton(onPressed: ()=> _clean(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Icon(Icons.cleaning_services, size: 30)
                  ),
                  ElevatedButton(onPressed: ()=> _reload(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        elevation: 0,
                      ),
                      child: Icon(Icons.restart_alt_rounded, size: 40)
                  ),
                ],
              ),

          // ------------------------ FOOTER -----------------------------
              Padding(padding: EdgeInsets.symmetric(vertical: 25)),
              Text("Javier Mancho",
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )
              ),
              Text("Task 2",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,

                ),
              ),
              Text("#RoadtoGSOC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  decoration: TextDecoration.underline,
                  decorationThickness: 3,
                  decorationColor: Colors.white,
                ),
              )
            ],
          ),
        ),
        ),
    );
  }
}
