import 'package:flutter/material.dart';

@immutable
abstract class DeviceState {}

class DeviceLoadingState extends DeviceState {}

class DeviceUpdatedState extends DeviceState {}
