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

class Trend_Page1 extends StatefulWidget {
  const Trend_Page1({super.key});

  @override
  State<Trend_Page1> createState() => _Trend_PageState1();
}

class _Trend_PageState1 extends State<Trend_Page1> {
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
                margin: EdgeInsets.only(bottom: 24),
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              'imageUrl'.isEmpty
                                  ? AssetImage("assets/Error.jpeg")
                                  : listResponse![index]['imageUrl'],
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          listResponse![index]['title'],
                          maxLines: 2,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          listResponse![index]['description'],
                          maxLines: 2,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                        Row(
                          children: [
                            Container(
                                height: size.height / 100,
                                width: size.width / 50,
                                decoration: BoxDecoration(
                                    color: listResponse![index]
                                                ['sourceConfidence'] as int >
                                            90
                                        ? Colors.green
                                        : Colors.red,
                                    borderRadius: BorderRadius.circular(100))),
                            const SizedBox(width: 5),
                            Container(
                              child: Text(
                                "Source :" +
                                    " " +
                                    listResponse![index]["dataSource"]
                                        .toString(),
                                style: TextStyle(
                                    color: Color.fromARGB(255, 79, 170, 255),
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
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
