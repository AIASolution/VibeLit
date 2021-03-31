import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibelit/bloc/app_bloc.dart';
import 'package:vibelit/bloc/bloc.dart';
import 'package:vibelit/bloc/data/bloc.dart';
import 'package:vibelit/config/params.dart';
import 'package:vibelit/util/preference_helper.dart';
import 'package:vibelit/util/utils.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  DataBloc() : super(DataLoadSuccessState());

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is DataLoadEvent) {
      yield* _mapDataLoadEventToState();
    }
  }

  Stream<DataState> _mapDataLoadEventToState() async* {
    if (Utils.isDeviceOn()) {
      String mode = PreferenceHelper.getString(Params.operationMode);
      // communicate with controller
      // save data
      PreferenceHelper.setString(Params.sensorData, mode);
      yield DataLoadingState();
      yield DataLoadSuccessState();
    }
  }
}