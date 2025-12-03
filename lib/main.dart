import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myencyclopedia/csharpvolume.dart';
import 'package:myencyclopedia/fluttervolume.dart';
import 'package:myencyclopedia/gridview_test.dart';
import 'package:myencyclopedia/homepage.dart';
import 'package:myencyclopedia/home_screen.dart';
import 'package:myencyclopedia/html5volume.dart';
import 'package:myencyclopedia/javavolume.dart';
import 'package:myencyclopedia/kotlinvolume.dart';
import 'package:myencyclopedia/listwheelscrollview_test.dart';
import 'package:myencyclopedia/pythonvolume.dart';
import 'package:myencyclopedia/springvolume.dart';
import 'package:myencyclopedia/swiftvolume.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to myEncyclopedia',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.grey.shade200,
        ),
        home: StartPage(),
      );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _MyStartPage createState() => _MyStartPage();
}

class _MyStartPage extends State<StartPage> {

  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  final List<VolumeItemData> volumeItems = [
    VolumeItemData(id: 1, name: "C#", image: Image.asset("assets/pngs/Csharp_Logo.png"), destinationPage: CsharpPage()),
    VolumeItemData(id: 2, name: "Flutter", image: Image.asset("assets/pngs/Flutter.png"), destinationPage: FlutterPage()),
    VolumeItemData(id: 3, name: "Java", image: Image.asset("assets/pngs/Java.png"), destinationPage: JavaPage()),
    VolumeItemData(id: 5, name: "Kotlin", image: Image.asset("assets/pngs/Kotlin.png"), destinationPage: KotlinPage()),
    VolumeItemData(id: 6, name: "Python", image: Image.asset("assets/pngs/python.png"), destinationPage: PythonPage()),
    VolumeItemData(id: 7, name: "Spring", image: Image.asset("assets/pngs/Spring.png"), destinationPage: SpringPage()),
    VolumeItemData(id: 8, name: "Swift", image: Image.asset("assets/pngs/Swift.png"), destinationPage: SwiftPage()),
    VolumeItemData(id: 9, name: "HTML5", image: Image.asset("assets/pngs/HTML5.png"), destinationPage: HTMLPage()),
  ];

/*     Text("How do I make an Android app?"),
    Text("How do I make a website?"),
    Text("How do I make a microservice?"),
    Text("How do I make an iOS app?"),
    Text("How do I make a video game?"),
    Text("How do I make an automated script?"),
    Text("How do I make an object-oriented program?"),
    Text("How do I make a mobile app?") */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "myEncyclopedia",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: 
      Container(
        child: SizedBox(
          child: 
            SingleChildScrollView(child: Container(
              color: Colors.lightBlue,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 1000,
                  height: 50,
                  color: Colors.blue.shade900,
                  child: Center(
                    child: Text(
                      "Choose a volume",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      ),
                  )
                ),
                SizedBox(
                  height: 460,
                  child: volumeGrid(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: Color.fromARGB(224, 92, 2, 236),
                      width: 390,
                      height: 180,
                      child: SuggestionListScreen(),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: Color.fromARGB(223, 7, 88, 238),
                      width: 390,
                      height: 60,
                    ),
                  ],
                ),
              ],
             )
            )
            )
          ),
        ),
    );
  }

  GridView volumeGrid() {
    return GridView.builder(
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                  ), 
                itemCount: volumeItems.length,
                itemBuilder: (context, index) {
                  return VolumeItemWidget(volumeItemData: volumeItems[index]);
                }
                );
  }

/* Widget buildInkWell() => InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FlutterPage()),
      );
  },
  child: Material(
    child: Container(
      child: Image.asset(
        "assets/pngs/Flutter.png",
        height: 150,
        width: 150,
        fit: BoxFit.contain,
      ),
    ),
    ),
  );

Widget buildCard() => Container(
  width: 150,
  height: 150,
  color: Colors.blue.shade700,
); */

// Button for testing
  Container getStartedButton(BuildContext context) {
    return Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SizedBox(
                  child: TextButton(
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AutoScrollingListScreen()));
                    }, 
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                      ),
                    ),
                ),
              );
  }
/*   var buildStartPage = <Widget>[
          Column(
            children: [
              Text("Welcome"),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 225.0),
              child: Container(
                height: 150.0,
                width: 450.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.lightBlue,
                ),
              )
            ),
          ),
        ]; */

/*   Align buildFrostedGlass() {
    return Align(
          alignment: Alignment.bottomCenter,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue.shade200.withOpacity(0.5),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 150.0,
                ),
              ),
            ),
          ),
        );
  }  */
}
