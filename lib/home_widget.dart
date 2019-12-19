import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'placeholder_widget.dart';
import 'alert_dialog.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
 
 class _HomeState extends State<Home> {
   ScrollController scrollController;
   int _currentIndex = 1;
   bool dialVisible = true;
   final List<Widget> _children = [
     PlaceholderWidget(Colors.white),
     PlaceholderWidget(Colors.deepOrange),
     PlaceholderWidget(Colors.green),
     PlaceholderWidget(Colors.blue)
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
       ),
       body: _children[_currentIndex],
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

 


