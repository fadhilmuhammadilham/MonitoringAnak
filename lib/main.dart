import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:qrabsen/view/homePage.dart';
import 'package:qrabsen/view/profilePage.dart';
import 'package:qrabsen/view/rekapPage.dart';
import 'package:qrabsen/view/test.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qrabsen/api/firebase_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCwKNw_VEP5N9u3taHFssqn_LaPDsEI5n4',
          appId: '1:122623884296:android:503be5a23403d0582825bd',
          messagingSenderId: '122623884296',
          projectId: 'qrabsen2'));
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentI = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [HomePage(), RekapPage(), ProfilePage(), TestPage()];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: widgets[currentI],
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.react,
            backgroundColor: Colors.white,
            activeColor: Color(0xFFABD6E4),
            color: Colors.grey,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.map, title: 'Rekap'),
              TabItem(icon: Icons.people, title: 'Profile'),
              TabItem(icon: Icons.people, title: 'Test'),
            ],
            onTap: (int i) {
              setState(() {
                currentI = i;
              });
            },
          )),
    );
  }
}
