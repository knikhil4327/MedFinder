import 'package:flutter/material.dart';

class MedicineCard extends StatelessWidget {
  final String medicineName;
  final String category;
  final double price;
  final bool available;
  final VoidCallback? onTap;

  const MedicineCard({
    super.key,
    required this.medicineName,
    required this.category,
    required this.price,
    required this.available,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.favorite_border, color: Colors.grey.shade500),
              ),

              Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green.shade50,
                  child: const Icon(
                    Icons.medication,
                    size: 36,
                    color: Color(0xFF2E7D32),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Text(
                medicineName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                category,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
              ),

              const SizedBox(height: 12),

              Text(
                "₹${price.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: available
                      ? Colors.green.shade100
                      : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    available ? "Available" : "Out of Stock",
                    style: TextStyle(
                      color: available ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
