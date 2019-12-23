import 'package:flutter/material.dart';
import 'package:yom_office_manager/pages/root_page.dart';
import 'package:yom_office_manager/services/authentication.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oficce Manager',
      debugShowCheckedModeBanner: false,
      home: new RootPage(auth: new Auth()),
    );
  }
}