class ProductItem {
  double price;
  String name;
  String picturePath;
  bool isFavorite;
  double score;
  int reviews;
  String about;
  ProductItem({
    required this.price,
    required this.name,
    required this.picturePath,
    this.isFavorite = false,
    required this.score,
    required this.reviews,
    required this.about,
  });
}
