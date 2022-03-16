import 'package:cheapeatsflutter/models/uberEats.dart';
import 'package:cheapeatsflutter/utils/bottomNavigation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../models/menuLog.dart';

class restaurantsView extends StatefulWidget {
  const restaurantsView({Key? key}) : super(key: key);

  @override
  _restaurantsViewState createState() => _restaurantsViewState();
}

class _restaurantsViewState extends State<restaurantsView> {

  @override
  void initState() {
    super.initState();
    uberEats().getData();
    menuLog().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  height: 325,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.95,
                        color: Colors.white,
                      ),
                    ),
                  )
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purple,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.yellow,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.pink,
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                ),

              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
