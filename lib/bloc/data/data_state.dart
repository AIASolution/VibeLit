import 'package:flutter/material.dart';

@immutable
abstract class DataState {}

class DataLoadingState extends DataState {}

class DataLoadSuccessState extends DataState {}

class DataLoadFailedState extends DataState {}
