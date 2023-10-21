import 'package:doctor_system/service/dio_helper.dart';
import 'package:doctor_system/service/shared_prefrence_helper.dart';
import 'package:doctor_system/src/app_root.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper.init();
  DioHelper.init();
runApp(const AppRoot());
}


