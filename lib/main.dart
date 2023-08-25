import 'package:bugbuster/views/create_bug_view.dart';
import 'package:bugbuster/views/login_page.dart';
import 'package:bugbuster/views/home_page.dart';
import 'package:flutter/material.dart';
import '../views/bug_detail_view.dart';
import '../views/home_view.dart';
import '../views/login_view.dart';
import '../views/signup_view.dart';
import '../models/bug.dart';
import 'views/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bug Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/createBug': (context) => CreateBugView(),
        '/bugDetail': (context) => BugDetailView(
              bug: ModalRoute.of(context)!.settings.arguments as Bug,
            ),
      },
    );
  }
}
