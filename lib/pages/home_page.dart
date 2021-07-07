import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final int days = 30;
  final String name = "anas";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CATALOG APP"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
