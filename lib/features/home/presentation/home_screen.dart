import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MedFinder',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              "Good Evening 👋",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            const Text(
              "Find your medicines instantly",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            TextField(
              decoration: InputDecoration(
                hintText: "Search medicines...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.local_hospital)),
                title: const Text("Emergency Search"),
                subtitle: const Text(
                  "Quickly locate nearby pharmacies with your medicine.",
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Medicine Categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1.8,
              children: const [
                _CategoryCard("Tablets", Icons.medication),
                _CategoryCard("Syrups", Icons.local_drink),
                _CategoryCard("First Aid", Icons.healing),
                _CategoryCard("Health Care", Icons.favorite),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              "Nearby Pharmacies",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const _PharmacyCard("Apollo Pharmacy", "0.6 km away", 4.8),

            const _PharmacyCard("MedPlus", "1.2 km away", 4.6),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _CategoryCard(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}

class _PharmacyCard extends StatelessWidget {
  final String name;
  final String distance;
  final double rating;

  const _PharmacyCard(this.name, this.distance, this.rating);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.local_pharmacy)),
        title: Text(name),
        subtitle: Text(distance),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber),
            Text(rating.toString()),
          ],
        ),
      ),
    );
  }
}
