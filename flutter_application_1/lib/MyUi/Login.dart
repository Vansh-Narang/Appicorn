import 'package:flutter/material.dart';
import 'package:flutter_application_1/MyUi/HomeScreen.dart';
import 'package:flutter_application_1/MyUi/Splash.dart';
import 'package:flutter_application_1/mainpage/open.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          "Login Now",
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
      body: Container(
        child: Column(children: [
          Image(height: 82, image: AssetImage('assets/loginPage.png')),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Text(
              "Welcome Back",
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
                      return 'Enter a valid email';
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
                      return 'Enter a Password';
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
          Container(
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
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
                  child: Text("Login Now")),
            ),
          )
        ]),
      ),
    );
  }
}
