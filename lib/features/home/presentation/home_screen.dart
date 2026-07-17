import 'package:flutter/material.dart';

import 'widgets/home_header.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/emergency_card.dart';
import 'widgets/category_card.dart';
import 'widgets/pharmacy_card.dart';
import 'widgets/medicine_card.dart';
import '../../search/presentation/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F8FB),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(userName: "Nikhil", location: "Chennai"),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: HomeSearchBar(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              const EmergencyCard(),

              const SizedBox(height: 28),

              //---------------------------------
              // Categories
              //---------------------------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .9,
                  children: const [
                    CategoryCard(
                      title: "Tablet",
                      icon: Icons.medication,
                      color: Colors.blue,
                    ),

                    CategoryCard(
                      title: "Syrup",
                      icon: Icons.local_drink,
                      color: Colors.orange,
                    ),

                    CategoryCard(
                      title: "First Aid",
                      icon: Icons.healing,
                      color: Colors.red,
                    ),

                    CategoryCard(
                      title: "Vitamin",
                      icon: Icons.favorite,
                      color: Colors.green,
                    ),

                    CategoryCard(
                      title: "Baby",
                      icon: Icons.child_care,
                      color: Colors.purple,
                    ),

                    CategoryCard(
                      title: "Diabetes",
                      icon: Icons.monitor_heart,
                      color: Colors.teal,
                    ),

                    CategoryCard(
                      title: "Skin",
                      icon: Icons.spa,
                      color: Colors.brown,
                    ),

                    CategoryCard(
                      title: "More",
                      icon: Icons.more_horiz,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //---------------------------------
              // Nearby Pharmacies
              //---------------------------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Nearby Pharmacies",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 185,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: const [
                    PharmacyCard(
                      pharmacyName: "Apollo Pharmacy",
                      distance: "450 m",
                      rating: 4.8,
                      isOpen: true,
                    ),

                    PharmacyCard(
                      pharmacyName: "MedPlus",
                      distance: "1.2 km",
                      rating: 4.6,
                      isOpen: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              //---------------------------------
              // Trending Medicines
              //---------------------------------
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      "Trending Medicines",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                height: 270,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MedicineCard(
                      medicineName: "Paracetamol",
                      category: "Tablet",
                      price: 25,
                      available: true,
                    ),

                    MedicineCard(
                      medicineName: "Dolo 650",
                      category: "Tablet",
                      price: 34,
                      available: true,
                    ),

                    MedicineCard(
                      medicineName: "Crocin",
                      category: "Tablet",
                      price: 29,
                      available: false,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
