import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  get margin => null;

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCAAmZtznsBoI4U4deySuutJDHG709dTAP-g&usqp=CAU";
    return Drawer(
      child: Container(
        color: Color(0xff403b58),
        child: ListView(
          children: [
            Container(
                color: Color(0xff403b58),
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    margin: EdgeInsets.zero,
                    accountName: Text("Anas baqai"),
                    accountEmail: Text("anashabib139@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ))),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.archivebox,
                color: Colors.white,
              ),
              title: Text(
                "Archive",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                "settings",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
