import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AppBloc {

  static final applicationBloc = ApplicationBloc();
  static final weatherBloc = WeatherBloc();
  static final statusBloc = StatusBloc();
  static final dataBloc = DataBloc();
  static final bluetoothBloc = BluetoothBloc();
  static final deviceBloc = DeviceBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(create: (context) => applicationBloc),
    BlocProvider<WeatherBloc>(create: (context) => weatherBloc),
    BlocProvider<StatusBloc>(create: (context) => statusBloc),
    BlocProvider<DataBloc>(create: (context) => dataBloc),
    BlocProvider<BluetoothBloc>(create: (context) => bluetoothBloc),
    BlocProvider<DeviceBloc>(create: (context) => deviceBloc),
  ];

  static void dispose() {
    applicationBloc.close();
    weatherBloc.close();
    statusBloc.close();
    dataBloc.close();
    bluetoothBloc.close();
    deviceBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();
  factory AppBloc() {
    return _instance;
  }
  AppBloc._internal();
}