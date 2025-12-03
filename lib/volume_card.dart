
import 'package:flutter/material.dart';
import 'volume.dart';

class VolumeCard extends StatefulWidget {

  final Volume volume;

  const VolumeCard({super.key, required this.volume});

  @override
  State<VolumeCard> createState() => _VolumeCardState();
}

class _VolumeCardState extends State<VolumeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(
              widget.volume.image,
              fit: BoxFit.cover,
            )
          )
        ],
      ),
    );
  }
}