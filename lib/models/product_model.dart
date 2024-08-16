class ProductModel {
  final dynamic id;
  final dynamic price;
  final String description;
  final String title;
  final String image;
  final String category;
  final RatingModel rating;

  ProductModel(
      {required this.rating,
      required this.id,
      required this.price,
      required this.description,
      required this.title,
      required this.image,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        price: jsonData['price'],
        description: jsonData['description'],
        title: jsonData['title'],
        image: jsonData['image'],
        category: jsonData['category'],
        rating: RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;
  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
