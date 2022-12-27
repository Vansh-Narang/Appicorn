import 'package:flutter/material.dart';
import 'package:flutter_application_1/Fetchdata/fetchdata.dart';
import 'package:flutter_application_1/MyUi/NewTrend.dart';
import 'package:flutter_application_1/MyUi/Sample.dart';
import 'package:flutter_application_1/Pages/home.dart';
import 'package:flutter_application_1/MyUi/HomeScreen.dart';
import 'package:flutter_application_1/MyUi/RegistorApp.dart';
import 'package:flutter_application_1/MyUi/Splash.dart';
import 'package:flutter_application_1/mainpage/open.dart';
import 'package:flutter_application_1/utils/colors.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:permission_handler/permission_handler.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light, primaryColor: AppColors.primary),
      home: Trend_Page1(),
    );
  }
}
