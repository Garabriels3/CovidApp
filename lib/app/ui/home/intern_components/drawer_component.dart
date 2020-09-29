import 'package:covid_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatefulWidget {
  Function logout;
  DrawerComponent({this.logout});
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkPrimaryColor,
      child: SafeArea(
        bottom: false,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: darkPrimaryColor,
                ),
                accountName: Text("Gabriel"),
                accountEmail: Text("gabrieldos@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "G",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: rosePrimaryColor,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text("Logout"),
                trailing: Icon(Icons.exit_to_app),
                onTap: () {
                  widget.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
