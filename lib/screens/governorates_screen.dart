import 'package:flutter/material.dart';
import 'package:untitled4/const.dart';
import 'package:untitled4/models/governorate_m.dart';
import 'package:untitled4/widgets/governorate_card.dart';

class GovernoratesScreen extends StatelessWidget {
  final List<Governorate> governorates = [
    Governorate(
      name: "دمشق",
      description: "العاصمة السورية وتعد من أقدم مدن العالم.",
      image: "assets/images/site4.jpg",
      places: [
        TouristPlace(
          name: "الجامع الأموي",
          description: "أحد أكبر وأقدم المساجد في العالم.",
          image: "assets/images/site4.jpg",
        ),
        TouristPlace(
          name: "البيت الدمشقي",
          description: "يمثل الطابع التقليدي للعمارة الدمشقية.",
          image: "assets/images/site4.jpg",
        ),
      ],
    ),
    Governorate(
      name: "اللاذقية",
      description: "محافظة ساحلية خلابة ومركز سياحي شهير.",
      image: "assets/images/site4.jpg",
      places: [
        TouristPlace(
          name: "رأس البسيط",
          description: "شاطئ سياحي رائع ومميز.",
          image: "assets/images/site4.jpg",
        ),
      ],
    ),
  ];

  GovernoratesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'المحافظات',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
          elevation: 0,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: governorates.length,
        itemBuilder: (context, index) {
          return GovernorateCard(governorate: governorates[index]);
        },
      ),
    );
  }
}
