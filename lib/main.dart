import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/pages/log_in_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: EmpressApp(),
      home: LogInPage(),
    );
  }
}
