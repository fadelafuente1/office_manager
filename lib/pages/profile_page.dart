
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yom_office_manager/services/authentication.dart';
import 'dart:async';

class ProfilePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => new _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {

  signOut() async {
    try {
      print('signout');
      // await widget.auth.signOut();
      // widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
        return Center(
          child: Text('Profile',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
              )
        );
  }

}