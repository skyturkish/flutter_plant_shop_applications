import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/IsFavoriteButtonn.dart';
import 'package:flutter_plant_shop_ui/core/container_picture.dart';
import 'package:flutter_plant_shop_ui/core/isFavoriteButton.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';
import 'package:flutter_plant_shop_ui/views/product_detail_view.dart';

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
      padding: PaddingUtilites().generalPadding,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final ProductItem currentProduct = _items[index];
        return Card(
          child: Column(
            children: [
              PictureAndFavoriteButton(
                currentProduct: currentProduct,
                index: index,
                items: _items,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
                child: InformationAboutProduct(currentProduct: currentProduct),
              )
            ],
          ),
        );
      },
    );
  }
}

class PictureAndFavoriteButton extends StatelessWidget {
  const PictureAndFavoriteButton({
    Key? key,
    required this.currentProduct,
    required this.index,
    required this.items,
  }) : super(key: key);
  final List<ProductItem> items;
  final ProductItem currentProduct;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 11 / 32,
            width: MediaQuery.of(context).size.width * 9 / 10,
            child: FittedBox(
                fit: BoxFit.fill,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ProductDetailPage(
                            current_item: items[index],
                          );
                        },
                        fullscreenDialog: true,
                        settings: const RouteSettings(),
                      ));
                    },
                    child: Image.asset(currentProduct.picturePath)))),
        IconButton(
          icon: IsFavoriteButton(currentProduct: currentProduct),
          onPressed: () {
            currentProduct.isFavorite = !currentProduct.isFavorite;
            
          },
        ),
      ],
    );
  }
}



class InformationAboutProduct extends StatelessWidget {
  const InformationAboutProduct({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  final ProductItem currentProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              currentProduct.name,
              style: Theme.of(context).textTheme.headline6,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${currentProduct.price}',
              style: Theme.of(context).textTheme.headline6,
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: Icon(
                  Icons.add_box_rounded,
                  color: Colors.green,
                  size: 48,
                )),
          ],
        )
      ],
    );
  }
}

class PaddingUtilites {
  final EdgeInsets generalPadding = EdgeInsets.all(8.0);
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

/**Fitted box parent'inde bir yer varsa kaplar. o an aldığı yeri değil. belirli sayılar olması lazım oranlar değil */