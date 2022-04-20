class ProductItem {
  double price;
  String name;
  String picturePath;
  bool isFavorite;
  ProductItem({
    required this.price,
    required this.name,
    required this.picturePath,
    this.isFavorite = false,
  });
}