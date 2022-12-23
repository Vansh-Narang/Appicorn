import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyUi/HomeScreen.dart';
import 'package:flutter_application_1/MyUi/Splash.dart';
import 'package:flutter_application_1/mainpage/open.dart';

class Registor_App extends StatefulWidget {
  const Registor_App({super.key});

  @override
  State<Registor_App> createState() => _Registor_AppState();
}

class _Registor_AppState extends State<Registor_App> {
  String firstname = "";
  String lastname = "";
  String email = "";
  String password = "";
  final _formKey = GlobalKey<FormState>();
  trysubmit() {
    final isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      _formKey.currentState!.save();
      submitform();
    } else {
      print("error");
    }
  }

  submitform() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Open_Page(),
        ));
    /*print(firstname);
    print(lastname);
    print(email);
    print(password);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Registor Your Account",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Image(image: AssetImage('assets/signup.jpg')),
          Container(
            child: Text(
              "Welcome",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(children: [
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2))),
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter Your Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                TextFormField(
                  obscureText: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.key),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2))),
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter Your Password';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
                TextFormField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      icon: Icon(Icons.near_me),
                      labelStyle: TextStyle(color: Colors.grey),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2))),
                  key: ValueKey('firstname'),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Enter Your Full Name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    email = value.toString();
                  },
                ),
              ]),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ))),
              onPressed: () {
                trysubmit();
              },
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Submit")),
            ),
          )
        ]),
      ),
    );
  }
}
