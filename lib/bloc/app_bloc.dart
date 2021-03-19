import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AppBloc {

  static final applicationBloc = ApplicationBloc();
  static final weatherBloc = WeatherBloc();
  static final statusBloc = StatusBloc();
  static final purificationBloc = PurificationBloc();

  static final List<BlocProvider> blocProviders = [
    BlocProvider<ApplicationBloc>(create: (context) => applicationBloc),
    BlocProvider<WeatherBloc>(create: (context) => weatherBloc),
    BlocProvider<StatusBloc>(create: (context) => statusBloc),
    BlocProvider<PurificationBloc>(create: (context) => purificationBloc),
  ];

  static void dispose() {
    applicationBloc.close();
    weatherBloc.close();
    statusBloc.close();
    purificationBloc.close();
  }

  ///Singleton factory
  static final AppBloc _instance = AppBloc._internal();
  factory AppBloc() {
    return _instance;
  }
  AppBloc._internal();
}