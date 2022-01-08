import 'package:flutter/material.dart';
import 'package:p_green/ui/pages/home_page.dart';
import 'package:p_green/ui/pages/profile_page.dart';
import 'package:p_green/ui/pages/qr_page.dart';
import 'package:p_green/utils/page_routers.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

SharedPreferences? prefs;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        PageRoutes.homePage: (context) => const HomePage(),
        PageRoutes.profilePage: (context) => const ProfilePage(),
        PageRoutes.qRViewExample: (context)=>const QRViewExample(),
      },
      home: const HomePage(),
    );
  }
}
