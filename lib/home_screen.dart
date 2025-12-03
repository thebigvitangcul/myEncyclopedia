import 'package:flutter/material.dart';
import 'package:myencyclopedia/my_product.dart';
import 'package:myencyclopedia/volume_card.dart';

// Old homescreen. Discontinued.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
        const Text(
          "Choose an encyclopedia",
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
           )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "Computer Science"),
              _buildProductCategory(index: 1, name: "Mathematics"),
              _buildProductCategory(index: 2, name: "Algorithms"),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 100),

          )
        ],
      )
    );
  }

  _buildProductCategory({required int index, required String name}) => 
  GestureDetector(
    onTap: () => setState(() => isSelected = index),
    child: Container(
            width: 100,
            height: 40,
            margin: const EdgeInsets.only(top: 10, right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected == index ? Colors.blue : Colors.blue.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              name,
             style: const TextStyle(color: Colors.white),
           ),
          )
  );

/*_buildVolume() => */

// Discontinued
  _buildAllVolumes() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100/140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyVolume.allVolumes.length,
    itemBuilder: (context, index) {
      final allVolumes = MyVolume.allVolumes[index];
      return VolumeCard(volume: allVolumes);
    },
  );
}

