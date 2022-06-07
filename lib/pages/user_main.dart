import 'package:flutter/material.dart';
import 'package:flowers_app/user/Scanimage.dart';
import 'package:flowers_app/user/dashboard.dart';
import 'package:flowers_app/user/profile.dart';
class UserMain extends StatefulWidget {
  const UserMain({Key key}) : super(key: key);

  @override
  State<UserMain> createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {

  int _selectedIndex = 0;
  static List<Widget> _widgetOption = <Widget>[
    Dashboard(),
    Profile(),
    ScanImage(),

  ];


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Dashboard',),
          BottomNavigationBarItem(
            icon:Icon(Icons.person),
            label: 'Profile',),
          BottomNavigationBarItem(
            icon:Icon(Icons.image),
            label: 'ScamImage',),
        ],
        currentIndex:_selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
