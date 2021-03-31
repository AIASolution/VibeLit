import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:vibelit/bloc/bloc.dart';
import 'package:vibelit/config/constants.dart';
import 'package:vibelit/config/params.dart';
import 'package:vibelit/config/styles.dart';
import 'package:vibelit/screen/operation_stop_screen.dart';
import 'package:vibelit/util/preference_helper.dart';
import 'package:vibelit/util/toasts.dart';
import 'package:vibelit/util/utils.dart';
import 'package:vibelit/widget/button/icon_circle_button.dart';

class OperationStartScreen extends StatefulWidget {

  final String mode;

  OperationStartScreen({this.mode});

  @override
  _OperationStartScreenState createState() => _OperationStartScreenState();
}

class _OperationStartScreenState extends State<OperationStartScreen> {
  BluetoothBloc _bluetoothBloc;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    _bluetoothBloc = BlocProvider.of<BluetoothBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    String mode = widget.mode == Constants.AIR_PURIFICATION_MODE ? Constants.Air_Purification : widget.mode == Constants.ODOUR_REMOVAL_MODE ? Constants.Odour_Removal : Constants.Surface_Disinfection;
    return Scaffold(
      backgroundColor: Styles.primaryGrey,
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconCircleButton(
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 24,
                        color: Colors.white,
                      ),
                      onClick: () {
                        Navigator.pop(context);
                      },
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Image.asset(
                    "assets/images/bar.png",
                    height: double.infinity,
                  )),
              SizedBox(
                height: 30,
              ),
              Text(
                "Mode selected",
                style: TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 10,),
              Text(
                mode.toUpperCase(),
                style: TextStyle(color: Styles.bgGreen, fontSize: 24, fontFamily: 'Montserrat'),
              ),
              SizedBox(height: 40,),
              Container(
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(32)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          Utils.getDeviceIntensity().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 60,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          Utils.getDeviceVolume().toString(),
                          style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 200,
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Intensity",
                          style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Volume(m3)",
                          style: TextStyle(color: Colors.white, fontSize: 10, fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
              TextButton(
                child: Text(
                  "Start",
                  style: TextStyle(color: Styles.bgGreen, fontSize: 20, fontFamily: 'Montserrat'),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
                ),
                onPressed: () async {
                  if (!isLoading) {
                    BluetoothConnection connection = (_bluetoothBloc.state as BluetoothConnectedState).connection;
                    String data = "";
                    if (widget.mode == Constants.AIR_PURIFICATION_MODE) {
                      data = "\n<L>\n";
                    } else if (widget.mode == Constants.ODOUR_REMOVAL_MODE) {
                      data = "\n<M>\n";
                    } else {
                      data = "\n<H>\n";
                    }
                    connection.output.add(utf8.encode(data));
                    setState(() {
                      isLoading = true;
                    });
                    await connection.output.allSent;
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OperationStopScreen(),));
                  }
                },
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          isLoading ? Center(child: CircularProgressIndicator(),) : Container()
        ],
      ),
    );
  }
}
