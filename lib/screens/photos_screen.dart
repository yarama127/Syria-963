import 'package:flutter/material.dart';
import 'package:untitled4/models/governorate_m.dart';

class PhotosScreen extends StatelessWidget {
  final TouristPlace place;

  const PhotosScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الصور')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Image.asset(place.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
