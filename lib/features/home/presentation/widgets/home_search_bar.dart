import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onTap;

  const HomeSearchBar({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const SizedBox(width: 16),

            const Icon(Icons.search, color: Colors.grey),

            const SizedBox(width: 12),

            const Expanded(
              child: Text(
                "Search medicines...",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mic_none_rounded),
            ),

            IconButton(onPressed: () {}, icon: const Icon(Icons.tune_rounded)),
          ],
        ),
      ),
    );
  }
}
