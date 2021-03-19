import 'package:flutter/material.dart';

@immutable
abstract class PurificationEvent {}

class PurificationStatusEvent extends PurificationEvent {}

class PurificationStartEvent extends PurificationEvent {}

class PurificationStopEvent extends PurificationEvent {}