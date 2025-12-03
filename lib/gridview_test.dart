import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myencyclopedia/csharpvolume.dart';
import 'package:myencyclopedia/fluttervolume.dart';

// 1. Define a data model
class GridItemData {
  final int id;
  final Color color;
  final String name;
  final Widget destinationPage;

  GridItemData({required this.id, required this.color, required this.name, required this.destinationPage});
}

class VolumeItemData {
  final int id;
  final String name;
  final Image image;
  final Widget destinationPage;

  VolumeItemData({required this.id, required this.name, required this.image, required this.destinationPage});
}

// 2. Create the destination page (SecondRoute)
class DetailPage extends StatelessWidget {
  final String itemName;
  const DetailPage({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail for $itemName')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the first route
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

// 3. Create the custom hoverable grid item widget
class HoverableGridItem extends StatefulWidget {
  final GridItemData data;

  const HoverableGridItem({super.key, required this.data});

  @override
  _HoverableGridItemState createState() => _HoverableGridItemState();
}

class VolumeItemWidget extends StatefulWidget {
  final VolumeItemData volumeItemData;

  const VolumeItemWidget({super.key, required this.volumeItemData});

  @override
  _VolumeItemState createState() => _VolumeItemState();
}

class _HoverableGridItemState extends State<HoverableGridItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector( // Use GestureDetector or InkWell for tap detection
        onTap: () {
          // Navigate to the detail page on tap
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.data.destinationPage),
          );
        },
        child: Card(
          color: widget.data.color,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Main content (e.g., Image)
              const Center(child: Icon(Icons.image, size: 50, color: Colors.white70)),

              // Text overlay visible on hover
              AnimatedOpacity(
                opacity: _isHovering ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  color: Colors.black54, // Semi-transparent overlay
                  child: Center(
                    child: Text(
                      widget.data.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _VolumeItemState extends State<VolumeItemWidget> {
  final bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => widget.volumeItemData.destinationPage),
        );
      },
      child: Card(
        child: Container(
          child: widget.volumeItemData.image,
        ),
        ),
      );
  }
}


// Main screen with GridView
/* class GridScreen extends StatelessWidget {
  GridScreen({super.key});

  final List<GridItemData> items = List.generate(
    20,
    (index) => GridItemData(
      id: index,
      color: Colors.primaries[index % Colors.primaries.length],
      name: 'Item $index',
      destinationPage: DetailPage(itemName: 'Item $index'),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Hover & Click Demo')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return HoverableGridItem(data: items[index]);
        },
      ),
    );
  }
}
 */