import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;
String ?colordetect;

class Trend_Page extends StatefulWidget {
  const Trend_Page({super.key});

  @override
  State<Trend_Page> createState() => _Trend_PageState();
}

class _Trend_PageState extends State<Trend_Page> {
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Trending',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://ranakshetram.vercel.app/api/v1/keyword"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        // print(stringResponse);
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['keywords'];
      });
    } else {
      return CircularProgressIndicator();
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    String a;
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ))
          ],
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
            child: Container(
              width: w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 218, 242, 255)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 0, right: 2),
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 90,
                                width: 67,
                                child: Image.network(
                                  listResponse![index]["imageUrl"],
                                  fit: BoxFit.cover,
                                )),
                            // SizedBox(height: 10),
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Text(
                              listResponse![index]["title"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 22),
                            )),
                            Row(children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  listResponse![index]["description"]
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: GoogleFonts.lato(),
                                ),
                              )
                            ]),
                            Row(
                              children: [
                                Container(
                                ),
                                // Container(
                                //   child: Text(
                                //     "Confidence :" +
                                //         " " +
                                //         listResponse![index]["sourceConfidence"]
                                //             .toString(),
                                //     style: GoogleFonts.roboto(
                                //         textStyle: TextStyle(
                                //             decoration:
                                //                 TextDecoration.underline,
                                //             fontWeight: FontWeight.w700)),
                                //   ),
                                // ),
                                // SizedBox(width: 10),
                                Container(
                                  child: Text(
                                    " " +
                                        "Category :" +
                                        " " +
                                        listResponse![index]["category"]
                                            .toString(),
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                "Data Source :" +
                                    " " +
                                    listResponse![index]["dataSources"]
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: listResponse == null ? 0 : listResponse!.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up_sharp),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

