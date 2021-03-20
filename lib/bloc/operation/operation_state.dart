import 'package:flutter/material.dart';

@immutable
abstract class OperationState {}

class OperationLoadingState extends OperationState {}

class OperationInProgressState extends OperationState {
  final String mode;
  final DateTime startedAt;

  OperationInProgressState({this.mode, this.startedAt});
}

class OperationStoppedState extends OperationState {}