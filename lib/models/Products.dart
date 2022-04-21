import 'package:flutter_plant_shop_ui/models/ProductItem.dart';

class ProductItems {
  FlowersPictures flowersPath = FlowersPictures();
  late final List<ProductItem> items;
  ProductItems() {
    items = [
      ProductItem(
          price: 40.50,
          name: 'Red Flower',
          picturePath: flowersPath.redFlower,
          score: 2.7,
          reviews: 100,
          about:
              'Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower Red flower '),
      ProductItem(
          price: 30.78,
          name: 'Blue Flower',
          picturePath: flowersPath.blueFlower,
          score: 3.8,
          reviews: 280,
          about:
              'Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower Blue Flower '),
      ProductItem(
          price: 57.99,
          name: 'Pink Flower',
          picturePath: flowersPath.pinkFlower,
          score: 4.7,
          reviews: 330,
          about:
              'Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower Pink Flower '),
      ProductItem(
          price: 31.31,
          name: 'Purple Flower',
          picturePath: flowersPath.purpleFlower,
          score: 3.9,
          reviews: 17,
          about:
              'Purple Flower Purple Flower Purple Flower Purple Flower Purple Flower '),
      ProductItem(
          price: 67.45,
          name: 'White Flower',
          picturePath: flowersPath.whiteFlower,
          score: 4.2,
          reviews: 3,
          about:
              'White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower White Flower '),
      ProductItem(
          price: 38.12,
          name: 'Yellow Flower',
          picturePath: flowersPath.yellowFlower,
          score: 4.5,
          reviews: 1487,
          about:
              'Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower Yellow Flower  '),
    ];
  }
}

class FlowersPictures {
  final String redFlower = 'assets/flowers/redflower.jpg';
  final String blueFlower = 'assets/flowers/blueflower.jpg';
  final String pinkFlower = 'assets/flowers/pinkflower.jpg';
  final String purpleFlower = 'assets/flowers/purpleflower.jpg';
  final String whiteFlower = 'assets/flowers/whiteflower.jpg';
  final String yellowFlower = 'assets/flowers/yellowflower.jpg';
}