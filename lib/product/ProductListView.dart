import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/container_picture.dart';
import 'package:flutter_plant_shop_ui/core/isFavoriteButton.dart';

class ListViewProductItems extends StatefulWidget {
  const ListViewProductItems({Key? key}) : super(key: key);

  @override
  State<ListViewProductItems> createState() => _ListViewProductItemsState();
}

class _ListViewProductItemsState extends State<ListViewProductItems> {
  late final List<ProductItem> _items;

  @override
  void initState() {
    _items = ProductItems().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Image.asset(_items[index].picturePath),
                  IsFavorite(isfavorite: _items[index].isFavorite,),
                  
                ],
              ),
              Text(_items[index].name)
            ],
          ),
        );
      },
    );
  }
}

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

class ProductItems {
  FlowersPictures flowersPath = FlowersPictures();
  late final List<ProductItem> items;
  ProductItems() {
    items = [
      ProductItem(
          price: 40.50, name: 'Red Flower', picturePath: flowersPath.redFlower),
      ProductItem(
          price: 30.78,
          name: 'Blue Flower',
          picturePath: flowersPath.blueFlower),
      ProductItem(
          price: 57.99,
          name: 'Pink Flower',
          picturePath: flowersPath.pinkFlower),
      ProductItem(
          price: 31.31,
          name: 'Purple Flower',
          picturePath: flowersPath.purpleFlower),
      ProductItem(
          price: 67.45,
          name: 'White Flower',
          picturePath: flowersPath.whiteFlower),
      ProductItem(
          price: 38.12,
          name: 'Yellow Flower',
          picturePath: flowersPath.yellowFlower),
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
/**Container(
          height: MediaQuery.of(context).size.height * 7 / 31,
          child: Card(
            
            color: Colors.black,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.amberAccent,
                )
              ],
            ),
          ),
        ); */










        /**Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*10/21,
              height: MediaQuery.of(context).size.height * 7 / 31,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(_items[index].picturePath),
                ),
              ),
            ),
            Container(height: 40,color: Colors.black,)
          ],
        );---------------Çalışıyor bu  */