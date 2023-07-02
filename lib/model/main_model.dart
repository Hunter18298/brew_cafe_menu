class MainModel {
  final int id;
  final String name;
  final String price;
  final String image;
  final int category;

  MainModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
  });
  factory MainModel.fromJson(Map<String, dynamic> json) {
    return MainModel(
      id: json["id"],
      name: json["name"],
      price: json["price"],
      image: json["image"],
      category: json["category"],
    );
  }
}
