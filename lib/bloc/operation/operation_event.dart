import 'package:flutter/material.dart';

@immutable
abstract class OperationEvent {}

class OperationStatusEvent extends OperationEvent {}

class OperationStartEvent extends OperationEvent {
  final String mode;

  OperationStartEvent({this.mode});
}

class OperationStopEvent extends OperationEvent {}