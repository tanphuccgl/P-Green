import 'package:flutter/material.dart';
import 'package:p_green/ui/pages/home_page.dart';
import 'package:p_green/ui/pages/profile_page.dart';

class BottomNar extends StatefulWidget {
  final int? index;

  const BottomNar({Key? key, this.index}) : super(key: key);

  @override
  _BottomNarState createState() => _BottomNarState();
}

class _BottomNarState extends State<BottomNar> {
  final int? _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;

      case 1:
        // Navigator.push(
        //   context,
        //
        //   MaterialPageRoute(builder: (context) => NotificationManagerPage()),
        // );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      case 3:
        // Navigator.push(
        //   context,
        //   // MaterialPageRoute(builder: (context) => ProfilePage()),
        //   MaterialPageRoute(builder: (context) => ProfilePageVer2()),
        // );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: size.width * 0.05),
          title:
              Text('Trang chủ', style: TextStyle(fontSize: size.width * 0.035)),
        ),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.list_alt, size: size.width * 0.05 ,), title: Text('Thời khóa biểu', style: TextStyle(fontSize: size.width * 0.035),)),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none, size: size.width * 0.05),
            title: Text('Thông báo',
                style: TextStyle(fontSize: size.width * 0.035))),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_sharp, size: size.width * 0.05),
            title: Text('Tài khoản',
                style: TextStyle(fontSize: size.width * 0.035))),
      ],
      currentIndex: widget.index! != null ? widget.index! : _selectedIndex!,
      selectedItemColor: Colors.teal,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
    );
  }
}
