class MedicineModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final bool available;
  final String pharmacy;
  final double rating;
  final String image;

  const MedicineModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.available,
    required this.pharmacy,
    required this.rating,
    required this.image,
  });
}
