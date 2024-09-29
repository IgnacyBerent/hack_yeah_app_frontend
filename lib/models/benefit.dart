class Benefit {
  String category;
  String description;
  String expirationDate;
  String id;
  String imageUrl;
  int inStock;
  String name;
  int price;

  Benefit({
    required this.category,
    required this.description,
    required this.expirationDate,
    required this.id,
    required this.imageUrl,
    required this.inStock,
    required this.name,
    required this.price,
  });

  factory Benefit.fromJson(Map<String, dynamic> json) {
    return Benefit(
      category: json['category'],
      description: json['description'],
      expirationDate: json['expirationDate'],
      id: json['id'],
      imageUrl: json['imageUrl'],
      inStock: json['inStock'],
      name: json['name'],
      price: json['price'],
    );
  }
}
