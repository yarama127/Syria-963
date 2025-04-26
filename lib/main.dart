import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled4/const.dart';
import 'package:untitled4/screens/ServicesScreen.dart';
import 'package:untitled4/screens/about_us.dart';
import 'package:untitled4/screens/contact_with_us.dart';
import 'package:untitled4/screens/governorates_screen.dart';
import 'package:untitled4/screens/homepage.dart';
import 'package:untitled4/screens/map.dart';
import 'package:untitled4/screens/privecy.dart';
import 'package:untitled4/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkPrivacyAccepted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('accepted_privacy') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: FutureBuilder<bool>(
        future: checkPrivacyAccepted(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return snapshot.data!
                ? const MainNavigation()
                : const PrivacyPage();
          }
        },
      ),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 2;
  final List<Widget> pages = [
    const AboutUsPage(),
    const SearchPage(),
    const Homepage(),
    SyriaMapPage(),
    const ContactUsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ServicesScreen();
    //  Scaffold(
    //     body: pages[selectedIndex],
    //     bottomNavigationBar: ConvexAppBar(
    //       backgroundColor: AppColors.backgroundWhite,
    //       color: AppColors.bottomBarInactive,
    //       activeColor: AppColors.bottomBarActive,
    //       initialActiveIndex: selectedIndex,
    //       onTap: (int index) {
    //         setState(() {
    //           selectedIndex = index;
    //         });
    //       },
    //       items: const [
    //         TabItem(icon: Icons.info_outline, title: 'About us'),
    //         TabItem(icon: Icons.search, title: 'Search'),
    //         TabItem(icon: Icons.home, title: 'Home'),
    //         TabItem(icon: Icons.map, title: 'Map'),
    //         TabItem(icon: Icons.contact_mail_outlined, title: 'Contact'),
    //       ],
    //     ));
  }
}
