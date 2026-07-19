import 'package:flutter/material.dart';
import '../models/pharmacy_model.dart';

class PharmacyDetailsScreen extends StatelessWidget {
  final PharmacyModel pharmacy;

  const PharmacyDetailsScreen({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pharmacy.name), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.green.shade100,
                child: const Icon(
                  Icons.local_pharmacy,
                  size: 60,
                  color: Colors.green,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              pharmacy.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text("Address"),
                subtitle: Text(pharmacy.address),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Rating"),
                subtitle: Text("${pharmacy.rating} / 5"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.route),
                title: const Text("Distance"),
                subtitle: Text("${pharmacy.distance} km away"),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(
                  pharmacy.isOpen ? Icons.check_circle : Icons.cancel,
                  color: pharmacy.isOpen ? Colors.green : Colors.red,
                ),
                title: const Text("Status"),
                subtitle: Text(pharmacy.isOpen ? "Open Now" : "Closed"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Phone"),
                subtitle: Text(pharmacy.phoneNumber),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Launch dialer
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Open Maps
                    },
                    icon: const Icon(Icons.navigation),
                    label: const Text("Directions"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
