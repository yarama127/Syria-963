import 'package:flutter/material.dart';
import 'package:untitled4/models/governorate_m.dart';

class InfoScreen extends StatelessWidget {
  final TouristPlace place;

  const InfoScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('المعلومات')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          place.description,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
