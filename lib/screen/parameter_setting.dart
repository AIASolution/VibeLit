import 'package:flutter/material.dart';
import 'package:vibelit/config/styles.dart';
import 'package:vibelit/screen/help_screen.dart';
import 'package:vibelit/widget/button/icon_circle_button.dart';

class ParameterSettingScreen extends StatefulWidget {
  @override
  _ParameterSettingScreenState createState() => _ParameterSettingScreenState();
}

class _ParameterSettingScreenState extends State<ParameterSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryGrey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconCircleButton(
                  icon: Icon(
                    Icons.info_outline,
                    size: 24,
                    color: Colors.white,
                  ),
                  onClick: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen(),));
                  },
                  size: 24,
                ),
                IconCircleButton(
                  icon: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.white,
                  ),
                  onClick: () {
                    Navigator.pop(context);
                  },
                  size: 24,
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          Text(
            "Parameters \n Settings",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Montserrat'),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 60,),

          Expanded(child: Container()),
          TextButton(
            child: Text(
              "Set",
              style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Montserrat'),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: Colors.white.withOpacity(0.1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
