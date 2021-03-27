import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibelit/bloc/device/device_event.dart';
import 'package:vibelit/bloc/device/device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceLoadingState());

  @override
  Stream<DeviceState> mapEventToState(DeviceEvent event) async* {
    if (event is DeviceCheckEvent) yield* _mapDeviceCheckEventToState();
  }

  Stream<DeviceState> _mapDeviceCheckEventToState() async* {
    yield DeviceLoadingState();
    yield DeviceUpdatedState();
  }
}