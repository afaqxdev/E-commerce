class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Product(
        id: 0,
        title: '',
        description: '',
        price: 0.0,
        discountPercentage: 0.0,
        rating: 0.0,
        stock: 0,
        brand: '',
        category: '',
        thumbnail: '',
        images: [],
      );
    }

    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] != null ? (json['price'] as num).toDouble() : 0.0),
      discountPercentage:
          (json['discountPercentage'] != null
              ? (json['discountPercentage'] as num).toDouble()
              : 0.0),
      rating:
          (json['rating'] != null ? (json['rating'] as num).toDouble() : 0.0),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images:
          json['images'] != null
              ? List<String>.from(json['images'].whereType<String>())
              : [],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'discountPercentage': discountPercentage,
    'rating': rating,
    'stock': stock,
    'brand': brand,
    'category': category,
    'thumbnail': thumbnail,
    'images': images,
  };
}
