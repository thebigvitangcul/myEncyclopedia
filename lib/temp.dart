/* import 'package:flutter/material.dart';

class GridviewTest extends StatelessWidget {
  const GridviewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Hover & Click Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
    );
  }
}

// 1. Define a Data Model
class GridItemData {
  final String title;
  final IconData icon;
  final Widget destinationPage;

  GridItemData({required this.title, required this.icon, required this.destinationPage});
}

// 2. Create the Navigation Destination (example page)
class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}

// 3. Build a Custom Grid Item Widget
class HoverableGridItem extends StatefulWidget {
  final GridItemData data;

  const HoverableGridItem({super.key, required this.data});

  @override
  State<HoverableGridItem> createState() => _HoverableGridItemState();
}

class _HoverableGridItemState extends State<HoverableGridItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    // MouseRegion tracks pointer entry/exit
    returnchild: InkWell(
        // InkWell provides tap functionality and ripple effect
        onTap: () {
          // Navigate to the destination page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.data.destinationPage),
          );
        },
        child: Material(
          elevation: _isHovering ? 10.0 : 4.0, // Optional: add elevation on hover
          borderRadius: BorderRadius.circular(8.0),
          color: _isHovering ? Colors.blueAccent.withOpacity(0.8) : Colors.blueGrey[700],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.data.icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              // Use an AnimatedOpacity to show/hide text smoothly
              AnimatedOpacity(
                opacity: _isHovering ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  widget.data.title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
  }
}

// 4. Implement the GridView
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  static final List<GridItemData> items = [
    GridItemData(title: 'Home', icon: Icons.home, destinationPage: const DetailPage(title: 'Home Detail')),
    GridItemData(title: 'Settings', icon: Icons.settings, destinationPage: const DetailPage(title: 'Settings Detail')),
    GridItemData(title: 'Profile', icon: Icons.person, destinationPage: const DetailPage(title: 'Profile Detail')),
    GridItemData(title: 'Search', icon: Icons.search, destinationPage: const DetailPage(title: 'Search Detail')),
    GridItemData(title: 'Favorite', icon: Icons.favorite, destinationPage: const DetailPage(title: 'Favorite Detail')),
    GridItemData(title: 'Help', icon: Icons.help, destinationPage: const DetailPage(title: 'Help Detail')),
    GridItemData(title: 'Logout', icon: Icons.logout, destinationPage: const DetailPage(title: 'Logout Detail')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive GridView')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          return HoverableGridItem(data: items[index]);
        },
      ),
    );
  }
}
 */

