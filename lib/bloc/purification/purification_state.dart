import 'package:flutter/material.dart';

@immutable
abstract class PurificationState {}

class PurificationInProgressState extends PurificationState {}

class PurificationStoppedState extends PurificationState {}