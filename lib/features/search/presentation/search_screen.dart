import 'package:flutter/material.dart';
import '../../home/data/dummy_home_data.dart';
import '../../home/models/medicine_model.dart';
import 'medicine_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  List<MedicineModel> filteredMedicines = medicines;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void searchMedicine(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMedicines = medicines;
      } else {
        filteredMedicines = medicines.where((medicine) {
          return medicine.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search Medicines"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: searchController,
                autofocus: true,
                onChanged: searchMedicine,
                decoration: InputDecoration(
                  hintText: "Search medicines...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                      searchMedicine("");
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Searches",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ActionChip(
                    label: Text("Paracetamol"),
                    onPressed: () {
                      searchController.text = "Paracetamol";
                      searchMedicine("Paracetamol");
                    },
                  ),
                  ActionChip(
                    label: Text("Dolo 650"),
                    onPressed: () {
                      searchController.text = "Dolo 650";
                      searchMedicine("Dolo 650");
                    },
                  ),

                  ActionChip(
                    label: Text("Vitamin C"),
                    onPressed: () {
                      searchController.text = "Vitamin C";
                      searchMedicine("Vitamin C");
                    },
                  ),

                  ActionChip(
                    label: Text("Crocin"),
                    onPressed: () {
                      searchController.text = "Crocin";
                      searchMedicine("Crocin");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Expanded(
                child: filteredMedicines.isEmpty
                    ? const Center(
                        child: Text(
                          "No medicines found",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredMedicines.length,
                        itemBuilder: (context, index) {
                          final medicine = filteredMedicines[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.medication),
                              ),
                              title: Text(medicine.name),
                              subtitle: Text(
                                "${medicine.category} • ${medicine.pharmacy}",
                              ),
                              trailing: Text(
                                "₹${medicine.price.toStringAsFixed(0)}",
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MedicineDetailsScreen(
                                      medicine: medicine,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
