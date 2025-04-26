import 'package:flutter/material.dart';
import 'package:untitled4/models/governorate_m.dart';

class SignLanguageScreen extends StatelessWidget {
  final TouristPlace place;

  const SignLanguageScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('لغة الإشارة')),
      body: const Center(
        child: Text('فيديو أو رسوم توضيحية للغة الإشارة'),
      ),
    );
  }
}
