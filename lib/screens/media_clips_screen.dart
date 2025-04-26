import 'package:flutter/material.dart';
import 'package:untitled4/models/governorate_m.dart';

class MediaClipsScreen extends StatelessWidget {
  final TouristPlace place;

  const MediaClipsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('مقاطع الوسائط')),
      body: const Center(
        child: Text('هنا يمكن عرض مقاطع الفيديو أو الصوت'),
      ),
    );
  }
}
