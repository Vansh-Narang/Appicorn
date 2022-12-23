import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home.dart';
import 'package:flutter_application_1/MyUi/Login.dart';
import 'package:flutter_application_1/MyUi/RegistorApp.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 227, 149, 32),
            title: Text("Newz App")),
        body: Column(children: [
          Container(
              height: 250,
              width: 1000,
              child: Image(
                  image: AssetImage("assets/download1.png"), fit: BoxFit.fill)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.orange),
              ),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 180, 123, 36)),
              ),
              Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 159, 123, 69)),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            child: Text(
              "See What's Going On!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  height: 3,
                  wordSpacing: 3),
            ),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
          //   ),
          //     ],
          //   ),
          SizedBox(height: 50),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ))),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Registor_App();
                          },
                        ));
                      },
                      child: Container(
                        child: Text(
                          "Registor",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return Login();
                        })));
                      },
                      child: Container(
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.orange),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ))),
                    onPressed: () async {
                      final Uri _url = Uri.parse('https://flutter.dev');
                      if (await canLaunchUrl(_url)) {
                        await launchUrl(_url);
                      } else {
                        // can't launch url, there is some error
                        throw "Could not launch $_url";
                      }
                    },
                    child: Container(
                      child: Text(
                        "Connect with Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    )),
              )
            ],
          )
        ]));
  }
}
