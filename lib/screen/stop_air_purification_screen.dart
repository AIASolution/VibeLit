import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vibelit/config/styles.dart';
import 'package:vibelit/screen/air_purification_screen.dart';
import 'package:vibelit/widget/button/icon_circle_button.dart';

class StopAirPurificationScreen extends StatefulWidget {
  @override
  _StopAirPurificationScreenState createState() => _StopAirPurificationScreenState();
}

class _StopAirPurificationScreenState extends State<StopAirPurificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgYellow,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container()),
                IconCircleButton(
                  icon: Icon(
                    Icons.clear,
                    size: 24,
                    color: Colors.black,
                  ),
                  onClick: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  size: 24,
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Text(
            "PROGRAM\nUNDER WAY",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40,),
          Text(
            "please don\'t enter\nthe room",
            style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 120,),
          Text(
            "Time remaining",
            style: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          TextButton(
            child: Text(
              "20 min",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Montserrat'),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: Colors.white.withOpacity(0.1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
            ),
          ),
          Expanded(child: Container()),
          TextButton(
            child: Text(
              "Stop",
              style: TextStyle(color: Colors.red, fontSize: 20, fontFamily: 'Montserrat'),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: Colors.white.withOpacity(0.1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
