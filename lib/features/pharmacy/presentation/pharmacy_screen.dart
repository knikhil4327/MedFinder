import 'package:flutter/material.dart';
import '../data/dummy_pharmacy_data.dart';
import 'pharmacy_details_screen.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pharmacies")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          final pharmacy = pharmacies[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),

              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.local_pharmacy, color: Colors.green),
              ),

              title: Text(
                pharmacy.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Text(pharmacy.address),
                  const SizedBox(height: 4),
                  Text("⭐ ${pharmacy.rating}   •   ${pharmacy.distance} km"),
                  const SizedBox(height: 4),
                  Text(
                    pharmacy.isOpen ? "Open Now" : "Closed",
                    style: TextStyle(
                      color: pharmacy.isOpen ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PharmacyDetailsScreen(pharmacy: pharmacy),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
