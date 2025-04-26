import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:untitled4/const.dart';
import 'package:untitled4/widgets/category.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  final List<String> sliderImages = [
    'assets/images/site1.jpg',
    'assets/images/site2.jpg',
    'assets/images/site3.jpg',
    'assets/images/site4.jpg'
  ];

  final List<Map<String, String>> categories = [
    {
      'image': 'assets/images/tourism_sites.jpg',
      'title': 'Tourism sites',
    },
    {
      'image': 'assets/images/hestorical_sites.jpg',
      'title': 'Historical sites',
    },
    {
      'image': 'assets/images/relagion_sites.jpg',
      'title': 'Relagion sites',
    },
    {
      'image': 'assets/images/services.jpg',
      'title': 'Services',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.primary),
              child: Text('القائمة', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text('عن التطبيق')),
          ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
                color: Colors.white,
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.language, color: Colors.white),
              onSelected: (value) {
                debugPrint("تم اختيار اللغة: $value");
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'ar', child: Text('العربية')),
                const PopupMenuItem(value: 'en', child: Text('English')),
                const PopupMenuItem(value: 'fr', child: Text('Français')),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 160.0,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              items: sliderImages.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(sliderImages.length, (index) {
              bool isActive = currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isActive ? 12 : 8,
                height: isActive ? 12 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.secondary : Colors.grey[300],
                ),
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tourism sites",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 100 / 100,
                children: categories.map((category) {
                  return Category_Card(
                    imageName: category['image']!,
                    title: category['title']!,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
