import '../models/medicine_model.dart';

final List<MedicineModel> medicines = [
  MedicineModel(
    id: "1",
    name: "Paracetamol",
    category: "Tablet",
    price: 25,
    available: true,
    pharmacy: "Apollo Pharmacy",
    rating: 4.8,
    image: "",
  ),

  MedicineModel(
    id: "2",
    name: "Dolo 650",
    category: "Tablet",
    price: 34,
    available: true,
    pharmacy: "MedPlus",
    rating: 4.7,
    image: "",
  ),

  MedicineModel(
    id: "3",
    name: "Crocin",
    category: "Tablet",
    price: 29,
    available: false,
    pharmacy: "Wellness Forever",
    rating: 4.5,
    image: "",
  ),

  MedicineModel(
    id: "4",
    name: "Azithromycin",
    category: "Antibiotic",
    price: 165,
    available: true,
    pharmacy: "Apollo Pharmacy",
    rating: 4.6,
    image: "",
  ),

  MedicineModel(
    id: "5",
    name: "Vitamin C",
    category: "Supplement",
    price: 120,
    available: true,
    pharmacy: "NetMeds Partner",
    rating: 4.9,
    image: "",
  ),
];
