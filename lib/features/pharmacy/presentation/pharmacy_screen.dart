import 'package:flutter/material.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pharmacies")),
      body: const Center(
        child: Text("Nearby Pharmacies", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
