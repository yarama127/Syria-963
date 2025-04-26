import 'package:flutter/material.dart';
import 'package:untitled4/const.dart';
import 'package:untitled4/screens/service_details_screen.dart';

class ServicesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Restaurants',
      'image': 'assets/images/resturant-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: 'Al Abraaj', details: 'Seafood & grilled dishes'),
        ServiceItemModel(
            name: 'Villa Mamas', details: 'Traditional Bahraini cuisine'),
      ]
    },
    {
      'name': 'Hotels',
      'image': 'assets/images/hotels-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: 'The Ritz-Carlton', details: '5-star luxury hotel'),
        ServiceItemModel(
            name: 'Downtown Rotana', details: 'City center hotel with spa'),
      ]
    },
    {
      'name': 'Tour Services',
      'image': 'assets/images/tour-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: "Manama City Tour",
            details: "Duration: 3 hrs\nLocation: Capital"),
        ServiceItemModel(
            name: "Desert Safari", details: "Full day\nCamel ride & lunch"),
      ]
    },
    {
      'name': 'Public Services',
      'image': 'assets/images/public-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: 'Post Office', details: 'Mailing and shipping services'),
        ServiceItemModel(
            name: 'Municipality', details: 'City documentation and permits'),
      ]
    },
    {
      'name': 'Cafes',
      'image': 'assets/images/cafes-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: 'Cafe Lilou', details: 'French-style bakery & coffee'),
        ServiceItemModel(
            name: 'Dose Cafe', details: 'Trendy cafe with great ambiance'),
      ]
    },
    {
      'name': 'Hospitals',
      'image': 'assets/images/hospital-removebg-preview.png',
      'items': [
        ServiceItemModel(
            name: 'BDF Hospital', details: 'Military medical services'),
        ServiceItemModel(
            name: 'Salmaniya Hospital', details: 'Public hospital'),
      ]
    },
  ];

  ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: AppColors.primary),
          ),
          centerTitle: true,
          title: const Text(
            "services",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          elevation: 0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: services.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return ServiceItem(
              name: services[index]['name'],
              imagePath: services[index]['image'],
              items: services[index]['items'],
            );
          },
        ),
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final List<ServiceItemModel> items;

  const ServiceItem({
    super.key,
    required this.name,
    required this.imagePath,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GenericServiceListScreen(
              title: name,
              items: items,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, width: 100, height: 100),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
