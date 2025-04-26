import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:untitled4/const.dart';

class SyriaMapPage extends StatelessWidget {
  final List<Map<String, dynamic>> governorates = [
    {"name": "دمشق", "lat": 33.5138, "lng": 36.2765},
    {"name": "ريف دمشق", "lat": 33.5167, "lng": 36.4},
    {"name": "حلب", "lat": 36.2021, "lng": 37.1343},
    {"name": "حمص", "lat": 34.7333, "lng": 36.7167},
    {"name": "حماة", "lat": 35.1333, "lng": 36.75},
    {"name": "اللاذقية", "lat": 35.5167, "lng": 35.7833},
    {"name": "طرطوس", "lat": 34.8833, "lng": 35.8833},
    {"name": "إدلب", "lat": 35.9333, "lng": 36.6333},
    {"name": "درعا", "lat": 32.6189, "lng": 36.1021},
    {"name": "السويداء", "lat": 32.7, "lng": 36.5667},
    {"name": "دير الزور", "lat": 35.3333, "lng": 40.15},
    {"name": "الحسكة", "lat": 36.4833, "lng": 40.75},
    {"name": "الرقة", "lat": 35.95, "lng": 39.0167},
    {"name": "القنيطرة", "lat": 33.1256, "lng": 35.8236},
  ];

  SyriaMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("خريطة سوريا", style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.primary,
          ),
        ),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(35.0, 38.5),
          initialZoom: 6.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.syria_map',
          ),
          MarkerLayer(
            markers: governorates.map((gov) {
              return Marker(
                width: 120,
                height: 60,
                point: LatLng(gov['lat'], gov['lng']),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on, color: Colors.red, size: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        gov['name'],
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
