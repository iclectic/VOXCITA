import 'package:flutter/material.dart';
import 'package:voxcita/app/app.dart';
import 'package:voxcita/app/bootstrap.dart';

Future<void> main() async {
  await bootstrap();
  runApp(const VoxCitaApp());
}
