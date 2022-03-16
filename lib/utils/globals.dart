// libraries
library busminder_flutter.globals;

// external packages
import 'dart:math';

import 'package:flutter/material.dart';

// local packages

String version = "1.0.0";
String build = "11";
Color busMinderPrimary = const Color(0xFF00BAB9); // busminder background color
Color venturaHeavy = const Color(0xff013D5B);
Color venturaLight = const Color(0xff0D4D6D);
int selectedIndex = 0;

bool stopsActive = false;
bool routeActive = false;
bool nightActive = false;
bool perspectiveActive = false;
bool northActive = false;
bool isDeveloper = false;

List<String> settingsList = [
  "Stops",
  "Route",
  "Night",
  "2D/3D",
  "North",
  "Developer"
];

class Students {
  static String name = '';
  static int id = 0;
  static String dob = '01-01-1970';
// static int grade = 0;
// static String suburb = '';
}

class FirebaseData {
  static const androidId = '1:350035706828:android:104f1e6d76d36467';
  static const iosId = '1:350035706828:ios:6c720142983d452f';
  static const apiKey = 'AIzaSyBkzKWj_tCwcGt1iTQzelMQOr9NM4K9puk';
  static const projectId = 'busminder-2017';
  static const packageId = 'com.busminder.driver';
}


Future<dynamic> showCustomDialog(BuildContext context,
    {required String title,
      required String bodyText,
      required GestureTapCallback? onTap,
    }) async {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: Text(bodyText),
          actions: <Widget>[
            MaterialButton(
                child: Text("CANCEL"),
                onPressed: () => Navigator.pop(context)),
            MaterialButton(
                child: Text("OK"),
                onPressed: onTap)
          ],
        );
      }
  );
}

bool stopsChecked = false;
bool routeChecked = false;
bool nightChecked = false;
bool trafficChecked = false;
bool dimensionChecked = false;
bool northChecked = false;
bool devChecked = false;

bool settingsVisible = false;

class settingsSliders extends StatefulWidget {
  String text;
  bool value;
  settingsSliders({Key? key, required this.value, required this.text}) : super(key: key);

  @override
  _settingsSlidersState createState() => _settingsSlidersState();
}

class _settingsSlidersState extends State<settingsSliders> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: settingsVisible,
      child: Padding(
          padding: EdgeInsets.only(left: 10, top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(widget.text, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left,),
                Switch(value: widget.value, onChanged: (bool? value) {setState(() {widget.value = !widget.value;});},),
              ],
            ),
          )
      ),
    );
  }
}

// Future<dynamic> showSettings(context) async {
//   showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           title: Text("Settings", style: TextStyle(color: Colors.white),),
//           backgroundColor: venturaHeavy.withOpacity(0.5),
//           content: settingsMenu(),
//           actions: <Widget>[
//             MaterialButton(
//                 child: Text("OK", style: TextStyle(color: Colors.white),),
//                 onPressed: () => Navigator.pop(context))
//           ],
//         );
//       }
//   );
// }

void popPage(context) {
  Navigator.pop(context);
  Navigator.pop(context);
}

Future<dynamic> swapPages(Widget page, context) {
  return //Navigator.push(context, MaterialPageRoute(builder: (context) => page),);
  Navigator.pushReplacement(context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
  );
}

double calculateDistance(lat1, lon1, lat2, lon2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p)/2 +
      c(lat1 * p) * c(lat2 * p) *
          (1 - c((lon2 - lon1) * p))/2;
  return 12742 * asin(sqrt(a));
}


Widget createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: busMinderPrimary,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/BusMinderLogo.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 25.0,
            left: 16.0,
            child: Text("BusMinder Driver",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold))),
        Positioned(
            bottom: 7.0,
            left: 16.0,
            child: Text("Bus ID: 11248",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,))),
      ]));
}

Widget createDrawerItem(
    {required IconData? icon, required String? text, required GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}
