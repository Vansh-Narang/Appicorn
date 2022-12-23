import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Trending_Page extends StatelessWidget {
  const Trending_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
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
      body: Expanded(
        child: Column(
          children: [
            Container(
              // color: Colors.blue,
              height: 100,
              width: 200,
              child: Center(
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    errorWidget: ((context, url, error) => Icon(Icons.error)),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi there"),
                      SizedBox(height: 5),
                      Text("Star Sports"),
                    ],
                  )),
                  CachedNetworkImage(
                    imageUrl: 'https://picsum.photos/250?image=9',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                    errorWidget: ((context, url, error) => Image.asset(
                          "assets/quiz.jpg",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi there"),
                      SizedBox(height: 5),
                      Text("Star Sports"),
                    ],
                  ))
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
