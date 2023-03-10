import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;
String? colordetect;
int temp = 99;

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
    final size = MediaQuery.of(context).size;
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 60,
                                width: 67,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    listResponse![index]["imageUrl"],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
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
                                listResponse![index]["category"].toString(),
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Color.fromARGB(255, 90, 90, 90),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            Container(
                                child: Text(
                              listResponse![index]["title"].toString(),
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w900, fontSize: 20),
                            )),
                            Row(children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  listResponse![index]["description"]
                                      .toString(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: GoogleFonts.lato(),
                                ),
                              )
                            ]),
                            Row(
                              children: [
                                Container(
                                    height: size.height / 100,
                                    width: size.width / 50,
                                    decoration: BoxDecoration(
                                        color: listResponse![index]
                                                        ['sourceConfidence']
                                                    as int >
                                                90
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(100))),
                                const SizedBox(width: 5),
                                Container(
                                  child: Text(
                                    "Source :" +
                                        " " +
                                        listResponse![index]["dataSources"]
                                            .toString(),
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 79, 170, 255),
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
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
