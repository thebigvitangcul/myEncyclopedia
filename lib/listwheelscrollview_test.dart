import 'dart:async';
import 'package:flutter/material.dart';

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

class AutoScrollingListScreen extends StatefulWidget {
  const AutoScrollingListScreen({super.key});

  @override
  State<AutoScrollingListScreen> createState() => _AutoScrollingListScreenState();
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
