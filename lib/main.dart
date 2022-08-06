import 'package:flutter/cupertino.dart';
import 'package:haicam/injection/locator.dart';
import 'package:haicam/myapp.dart';

void main(List<String> args) {
  configureDependencies();
  runApp(const MyApp());
}
