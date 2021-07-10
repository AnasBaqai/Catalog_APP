import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Login Page",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "enter username", labelText: "Username")),
                    TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "enter password",
                          labelText: "Password",
                        )),
                    SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        },
                        child: Text("Login"),
                        style: TextButton.styleFrom(
                          minimumSize: Size(150, 40),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
