

class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  const ProductsModel({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      category: json['category'],
      description: json['description'],
      id: json['id'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
      title: json['title'],
    );
  }
}
