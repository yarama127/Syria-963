import 'package:flutter/material.dart';
import 'package:untitled4/const.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  Widget _buildSection({required String title, required String content}) {
    return Card(
      color: AppColors.backgroundWhite,
      elevation: 4,
      shadowColor: AppColors.shadow,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.info_outline, size: 80, color: AppColors.primary),
            const SizedBox(height: 10),
            const Text(
              '963SY App',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: "Who We Are",
              content:
                  "Artfly Foundation is a pioneer in innovation and documentation, specializing in aerial photography using drone technology.",
            ),
            _buildSection(
              title: "What is 963SY?",
              content:
                  "963SY is a comprehensive mobile platform that makes tourism accessible to everyone, regardless of physical or linguistic barriers.",
            ),
            _buildSection(
              title: "Our Mission",
              content:
                  "We aim to promote Syria's rich history, heritage, and tourist attractions through curated content, photos, and videos that highlight the country’s true beauty and cultural significance.",
            ),
          ],
        ),
      ),
    );
  }
}
