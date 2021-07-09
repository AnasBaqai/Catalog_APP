import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: 10,
            ),
            Text("WELCOME",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
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
                  ElevatedButton(
                    onPressed: () {
                      print("successful");
                    },
                    child: Text("Sign up"),
                    style: ButtonStyle(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
