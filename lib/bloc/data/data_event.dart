import 'package:flutter/material.dart';

@immutable
abstract class DataEvent {}

class DataLoadEvent extends DataEvent {}