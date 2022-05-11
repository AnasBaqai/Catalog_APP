import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CouponPage extends StatefulWidget {
  @override
  _CouponPageState createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  String name = "";
  bool changebutton = false;
  final _formKey = GlobalKey<FormState>();

  get value => null;
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
    }
  }

  get child => null;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/coupon.jpg",
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("ADD COUPON",
                    style: TextStyle(
                      fontSize: 40,
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
                            hintText: "enter code", labelText: "Coupon code"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ("coupon code cannot be empty");
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Type",
                          labelText: "Coupon Type",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "OFFER PERCANTAGE/AMOUNT",
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "START DATE",
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: context.theme.buttonColor,
                        child: InkWell(
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 40,
                            alignment: Alignment.center,
                            child: changebutton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      ),

                      /* ElevatedButton(
                           onPressed: () {
                             Navigator.pushNamed(context, MyRoutes.homeRoute);
                             
                           },
                           child: Text("Login"),
                           style: TextButton.styleFrom(
                             minimumSize: Size(150, 40),
                           )
                           )*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
