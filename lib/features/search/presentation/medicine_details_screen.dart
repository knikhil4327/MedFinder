import 'package:flutter/material.dart';
import '../../home/models/medicine_model.dart';

class MedicineDetailsScreen extends StatelessWidget {
  final MedicineModel medicine;

  const MedicineDetailsScreen({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medicine Details"), centerTitle: true),
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
                  Icons.medication,
                  size: 60,
                  color: Color(0xFF2E7D32),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              medicine.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              medicine.category,
              style: const TextStyle(color: Colors.grey, fontSize: 18),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.currency_rupee),
                title: const Text("Price"),
                subtitle: Text("₹${medicine.price}"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.local_pharmacy),
                title: const Text("Pharmacy"),
                subtitle: Text(medicine.pharmacy),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Rating"),
                subtitle: Text("${medicine.rating} / 5"),
              ),
            ),

            Card(
              child: ListTile(
                leading: Icon(
                  medicine.available ? Icons.check_circle : Icons.cancel,
                  color: medicine.available ? Colors.green : Colors.red,
                ),
                title: const Text("Availability"),
                subtitle: Text(
                  medicine.available ? "Available" : "Out of Stock",
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "This is a sample medicine description. "
              "Later this information will come from Firebase or a medicine database.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: Open Nearby Pharmacies
                },
                icon: const Icon(Icons.location_on),
                label: const Text("Find Nearby Pharmacy"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
