class ProductList {
  final List<Products> products;
  ProductList({required this.products});

  factory ProductList.fromJson(List<dynamic> parsedJson) {
    // print('---------- Flag parsedJson ----------');
    List<Products> products =
        parsedJson.map((e) => Products.fromJson(e)).toList();
    // print('---------- Flag parsedJson ${products[0].title} ----------');
    return ProductList(products: products);
  }
}

class Products {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    // print('---------- Flag Products.fromJson ----------');
    // print('---------- ${json["id"]} ----------');
    // print('---------- ${json["title"]} ----------');
    return Products(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      description: json["description"],
      category: json["category"],
      image: json["image"],
    );
  }
}
