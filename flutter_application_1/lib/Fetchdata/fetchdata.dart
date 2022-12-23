import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

String? stringResponse;
Map? mapResponse;

class fetch_data extends StatefulWidget {
  const fetch_data({super.key});

  @override
  State<fetch_data> createState() => _fetch_dataState();
}

class _fetch_dataState extends State<fetch_data> {
  //Fetch data
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://ranakshetram.vercel.app/api/v1/keyword"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        //   mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          height: 100,
          width: 100,
          child: Center(child: Text(stringResponse.toString())),
        ),
      ),
    );
  }
}
