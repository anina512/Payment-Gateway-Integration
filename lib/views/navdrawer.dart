import 'dart:io';

import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white30,
        child: ListView(
          children: <Widget>[
            ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home),
              onTap: (){
                  Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
                title: Text('Donate'),
                trailing: Icon(Icons.money),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/donate');
              },
            ),
            ListTile(
                title: Text('About'),
                trailing: Icon(Icons.info),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Exit'),
              trailing: Icon(Icons.close),
              onTap: (){
                exit(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
