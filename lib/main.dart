import 'package:flutter/material.dart';
import 'package:flutter_rest_api/home_page.dart';

void main() {
  runApp(const MyApp());
}

/*API = Application Programming Interface
  an api is a set of programming codes that enables data transmission
  between one software to another. */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xff0c0e0c),
        appBar: AppBar(
          title: const Center(child: Text("API Integration")),
          backgroundColor: const Color(0xff0c0e0c),
          elevation: 0,
        ),
        body: const HomePage(),
      ),
    );
  }
}
