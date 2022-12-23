import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

String? stringResponse;
Map? mapResponse;

class Open_Page extends StatefulWidget {
  const Open_Page({super.key});

  @override
  State<Open_Page> createState() => _Open_PageState();
}

class _Open_PageState extends State<Open_Page> {
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

  final fieldText = TextEditingController();
  void cleartext() {
    fieldText.clear();
  }

  // Future<String> getData() {
  //   return Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       return "Data fetched";
  //     },
  //   );
  // }
  Future apicall() async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://ranakshetram.vercel.app/api/v1/keyword"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        //   mapResponse = json.decode(response.body);
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
    var h = MediaQuery.of(context).size.height;
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
            "Tech Newz",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: new EdgeInsets.only(top: 20),
                child: Text(
                  "Hi Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Explore Today's",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  hintText: "Search",
                ),
                controller: fieldText,
              ),
              SizedBox(height: 30),
              Container(
                child: Row(children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: getColor(Colors.black, Colors.teal),
                      ),
                      onPressed: () {},
                      child: Text("Tech")),
                  SizedBox(width: 23),
                  ElevatedButton(onPressed: () {}, child: Text("Sports")),
                  SizedBox(width: 23),
                  ElevatedButton(onPressed: () {}, child: Text("Politics")),
                  SizedBox(width: 23),
                  ElevatedButton(onPressed: () {}, child: Text("Music")),
                ]),
              ),
              SizedBox(height: 30),
              Text(
                "Trending Today",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.red,
                      width: w,
                      height: 150,
                      child: Center(child: Text(stringResponse.toString())),
                      // child: FutureBuilder(
                      //   future: apicall(),
                      //   builder: (context, snapshot) {
                      //     if (snapshot.connectionState ==
                      //         ConnectionState.done) {
                      //       final data = snapshot.data as String;
                      //       return Center(
                      //           child: Text(
                      //         "$data",
                      //         style: TextStyle(fontSize: 18),
                      //         //   return Awesomedata(snapshot.data);
                      //       ));
                      //     } else {
                      //       return Center(child: CircularProgressIndicator());
                      //     }
                      //   },
                      // ),
                      // child: Image(
                      //     image: NetworkImage(
                      //         "https://www.shutterstock.com/image-photo/surreal-image-african-elephant-wearing-260nw-1365289022.jpgZ"),
                      //     fit: BoxFit.fitWidth),
                    ),
                    Container(
                        height: 100,
                        width: w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text("Here you will get the news Info"),
                            ),
                            //  SizedBox(height: 156),
                            Container(
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("Read more")),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
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

MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}
