import 'dart:async';
import 'package:cheapeatsflutter/utils/globals.dart';
import 'package:cheapeatsflutter/views/restaurantsView.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class splashView extends StatefulWidget {
  const splashView({Key? key}) : super(key: key);

  @override
  _splashViewState createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {

  String loadingText = "Cooking Tater Tots";
  int timerCount = 0;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          timerCount++;
          switch(timerCount) {
            case 1:
              Navigator.push(context, MaterialPageRoute(builder: (context) => restaurantsView()),);
              loadingText = "Preparing the special sauce";
              break;
            case 8:
              loadingText = "Finding the best deals for you!";
              break;
            case 10:
              break;
          }
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 50, minWidth: 150),
                    child: Image(image: AssetImage('assets/images/cheapEats.png'),),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.2),
                      child: Text("[${timerCount}] ${loadingText}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    )
                )
              ],
            )
        )
    );
  }
}