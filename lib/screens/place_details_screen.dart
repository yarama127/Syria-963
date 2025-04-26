import 'package:flutter/material.dart';
import 'package:untitled4/const.dart';
import 'package:untitled4/models/governorate_m.dart';
import 'package:untitled4/screens/info_screen.dart';
import 'package:untitled4/screens/map_direction_screen.dart';
import 'package:untitled4/screens/media_clips_screen.dart';
import 'package:untitled4/screens/photos_screen.dart';
import 'package:untitled4/screens/sign_language_screen.dart';
import 'package:untitled4/screens/virtual_tour_screen.dart';

class PlaceDetailsScreen extends StatelessWidget {
  final TouristPlace place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            automaticallyImplyLeading: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            centerTitle: true,
            title: Text(
              place.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                place.image,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    place.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textPrimary.withOpacity(0.7),
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _FeatureItem(
                        imagePath: 'assets/images/info.png',
                        label: 'المعلومات',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InfoScreen(place: place),
                              ));
                        },
                      ),
                      _FeatureItem(
                        imagePath: 'assets/images/photo.png',
                        label: 'الصور',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PhotosScreen(place: place),
                              ));
                        },
                      ),
                      _FeatureItem(
                        imagePath: 'assets/images/virtual.png',
                        label: 'جولة افتراضية',
                        onTap: () {},
                      ),
                      _FeatureItem(
                        imagePath: 'assets/images/goto.png',
                        label: 'توجه للمكان',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MapDirectionScreen(place: place),
                              ));
                        },
                      ),
                      _FeatureItem(
                        imagePath: 'assets/images/video.png',
                        label: 'مقاطع الوسائط',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MediaClipsScreen(place: place),
                              ));
                        },
                      ),
                      _FeatureItem(
                        imagePath: 'assets/images/signlanguage.png',
                        label: "لغة الاشارة",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SignLanguageScreen(place: place),
                              ));
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

class _FeatureItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  const _FeatureItem({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[50],
            radius: 30,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
