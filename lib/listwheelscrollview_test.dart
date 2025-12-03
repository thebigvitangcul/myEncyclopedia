import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myencyclopedia/csharpvolume.dart';
import 'package:myencyclopedia/fluttervolume.dart';
import 'package:myencyclopedia/html5volume.dart';
import 'package:myencyclopedia/javavolume.dart';
import 'package:myencyclopedia/kotlinvolume.dart';
import 'package:myencyclopedia/pythonvolume.dart';
import 'package:myencyclopedia/springvolume.dart';
import 'package:myencyclopedia/swiftvolume.dart';

class WheelTest extends StatelessWidget {
  const WheelTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WheelTest',
    );
  }
}

// Data model for list items
class ListItem {
  final String title;
  final Widget targetPage;

  ListItem({required this.title, required this.targetPage});
}

class SuggestionItem {
  final String title;
  final Widget destinationPage;

  SuggestionItem({required this.title, required this.destinationPage});
}

class AutoScrollingListScreen extends StatefulWidget {
  const AutoScrollingListScreen({super.key});

  @override
  State<AutoScrollingListScreen> createState() => _AutoScrollingListScreenState();
}

class SuggestionListScreen extends StatefulWidget {
  const SuggestionListScreen({super.key});

  @override
  State<SuggestionListScreen> createState() => _SuggestionListState();
}

class _AutoScrollingListScreenState extends State<AutoScrollingListScreen> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 0);
  late Timer _timer;
  int _counter = 0;
  final double _itemExtent = 60; // All children must have the same size

  final List<ListItem> items = [
    ListItem(title: 'Page 1 (Red)', targetPage: const DetailPage(color: Colors.red, title: 'Page 1')),
    ListItem(title: 'Page 2 (Green)', targetPage: const DetailPage(color: Colors.green, title: 'Page 2')),
    ListItem(title: 'Page 3 (Blue)', targetPage: const DetailPage(color: Colors.blue, title: 'Page 3')),
    ListItem(title: 'Page 4 (Yellow)', targetPage: const DetailPage(color: Colors.yellow, title: 'Page 4')),
    ListItem(title: 'Page 5 (Purple)', targetPage: const DetailPage(color: Colors.purple, title: 'Page 5')),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    // Scroll every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_counter < items.length) {
        _scrollController.animateToItem(
          _counter,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _counter++;
      } else {
        _counter = 0; // Loop back to the start
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToDetailPage(BuildContext context, Widget page) {
    // Stop the auto-scroll when an item is tapped
    _timer.cancel();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((_) {
      // Resume auto-scroll when returning to this screen
      _startAutoScroll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto-Scrolling ListWheel'),
      ),
      body: Center(
        child: SizedBox(
          height: 300, // Constrain the height for ListWheelScrollView
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: _itemExtent,
            diameterRatio: 1.5,
            physics: const FixedExtentScrollPhysics(), // Use this physics with FixedExtentScrollController
            childDelegate: ListWheelChildLoopingListDelegate( // Use looping delegate for infinite feel
              children: List<Widget>.generate(
                items.length,
                (index) => Center(
                  child: TextButton(
                    onPressed: () => _navigateToDetailPage(context, items[index].targetPage),
                    child: Text(
                      items[index].title,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SuggestionListState extends State<SuggestionListScreen> {
  final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(initialItem: 0);
  late Timer _timer;
  int _counter = 0;
  final double _itemExtent = 60;

  final List<SuggestionItem> items = [
    SuggestionItem(title: "How do I make a video game?", destinationPage: CsharpPage()),
    SuggestionItem(title: "How do I make a mobile app?", destinationPage: FlutterPage()),
    SuggestionItem(title: "How do I make an object-oriented program?", destinationPage: JavaPage()),
    SuggestionItem(title: "How do I make an Android app?", destinationPage: KotlinPage()),
    SuggestionItem(title: "How do I make an automated script?", destinationPage: PythonPage()),
    SuggestionItem(title: "How do I make a microservice?", destinationPage: SpringPage()),
    SuggestionItem(title: "How do I make an iOS app?", destinationPage: SwiftPage()),
    SuggestionItem(title: "How do I make a website?", destinationPage: HTMLPage()),

  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    // Scroll every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_counter < items.length) {
        _scrollController.animateToItem(
          _counter,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        _counter++;
      } else {
        _counter = 0; // Loop back to the start
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _navigateToDetailPage(BuildContext context, Widget page) {
    // Stop the auto-scroll when an item is tapped
    _timer.cancel();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    ).then((_) {
      // Resume auto-scroll when returning to this screen
      _startAutoScroll();
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(224, 92, 2, 236),
        child: SizedBox(
          height: 300, // Constrain the height for ListWheelScrollView
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: _itemExtent,
            diameterRatio: 1.5,
            physics: const FixedExtentScrollPhysics(), // Use this physics with FixedExtentScrollController
            childDelegate: ListWheelChildLoopingListDelegate( // Use looping delegate for infinite feel
              children: List<Widget>.generate(
                items.length,
                (index) {
                  var textButton = TextButton(
                    onPressed: () => _navigateToDetailPage(context, items[index].destinationPage),
                    child: AutoSizeText(
                      items[index].title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 253, 253)),
                    ),
                  );
                  return Center(
                  child: Container(
                    width: 360,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 82, 8, 131),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: SizedBox(
                      child: textButton,
                    ),
                  ),
                );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// A simple detail page widget
class DetailPage extends StatelessWidget {
  final Color color;
  final String title;

  const DetailPage({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go Back'),
        ),
      ),
      backgroundColor: color.withOpacity(0.5),
    );
  }
}
