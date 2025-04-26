import 'package:flutter/material.dart';
import 'package:untitled4/models/governorate_m.dart';

class MapDirectionScreen extends StatelessWidget {
  final TouristPlace place;

  const MapDirectionScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الموقع على الخريطة')),
      body: const Center(
        child: Text('هنا خريطة للمكان (Google Map أو أي خدمة أخرى)'),
      ),
    );
  }
}
