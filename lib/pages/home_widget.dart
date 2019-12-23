import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yom_office_manager/pages/profile_page.dart';
import 'package:yom_office_manager/services/authentication.dart';
import 'placeholder_widget.dart';
import 'alert_dialog.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  Home({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
 
 class _HomeState extends State<Home> {
   ScrollController scrollController;
   int _currentIndex = 1;
   bool dialVisible = true;
   var pages = [
     new PlaceholderWidget(Colors.white),
     new PlaceholderWidget(Colors.deepOrange),
     new PlaceholderWidget(Colors.green),
     new PlaceholderWidget(Colors.grey),
     new ProfilePage(),
   ];
   @override
    void initState() {
      super.initState();

      scrollController = ScrollController()
        ..addListener(() {
          setDialVisible(scrollController.position.userScrollDirection ==
              ScrollDirection.forward);
        });
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Oficce Manager'),
         actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
       ),
       body: pages[_currentIndex],
       floatingActionButton: buildSpeedDial(),
       bottomNavigationBar: buildBottomNavigation(),
       );
   }
   BottomNavigationBar buildBottomNavigation() {
     return BottomNavigationBar(
         onTap: onTabTapped,
         currentIndex: _currentIndex, // this will be set when a new tab is tapped
         selectedItemColor: Colors.black,
         unselectedItemColor: Colors.blueGrey,
         backgroundColor: Colors.white,
         items: [
           BottomNavigationBarItem(
             icon: new Icon(Icons.score),
             title: new Text('Ping Pong')
           ),
           BottomNavigationBarItem(
             icon: new Icon(Icons.local_cafe),
             title: new Text('Cafe')
           ),
           BottomNavigationBarItem(
             icon: new Icon(Icons.rss_feed),
             title: new Text('Noticias')
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.calendar_today),
             title: Text('Salas')
             ),
           BottomNavigationBarItem(
             icon: Icon(Icons.person),
             title: Text('Perfil')
             ),
         ]
       );
   }
   SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      visible: dialVisible,
      curve: Curves.bounceIn,
      child: new Icon(Icons.add),
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () => openSinglesForm(),
          label: 'Agregar singles',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.white,
        ),
        SpeedDialChild(
          child: Icon(Icons.person_add, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('SECOND CHILD'),
          label: 'Agregar dobles',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.white,
        ),
      ],
    );
  }

  signOut() async {
    try {
      print('signout');
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  void openSinglesForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog();
      });
  }
  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }
   void onTabTapped(int index) {
     setState(() {
       _currentIndex = index;
     });
   }
 }

 


