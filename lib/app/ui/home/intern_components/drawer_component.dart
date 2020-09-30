import 'package:covid_app/core/constants/colors.dart';
import 'package:covid_app/core/constants/dimens.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerComponent extends StatefulWidget {
  Function logout;
  String email;
  String name;

  DrawerComponent({this.email, this.name, this.logout});
  
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
                accountName: Text(widget.name),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    widget.name[0],
                    style: TextStyle(
                      fontSize: forty,
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
