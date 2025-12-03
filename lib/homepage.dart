import 'package:flutter/material.dart';
import 'package:myencyclopedia/home_screen.dart';


// Directs to home screen

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List screens = [
    HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("myEncyclopedia"),
        centerTitle: true,
      ),

      body: screens[currentIndex],
    );
  }
}