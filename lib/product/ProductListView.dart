import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/navigatorhelper.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';
import 'package:flutter_plant_shop_ui/models/Products.dart';
import 'package:flutter_plant_shop_ui/product/favorite_button.dart';
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
                padding: PaddingUtilites().productInformation,
                child: InformationAboutProduct(currentProduct: currentProduct),
              )
            ],
          ),
        );
      },
    );
  }
}

class PictureAndFavoriteButton extends StatefulWidget {
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
  State<PictureAndFavoriteButton> createState() =>
      _PictureAndFavoriteButtonState();
}

class _PictureAndFavoriteButtonState extends State<PictureAndFavoriteButton>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    print("selam");
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 11 / 32,
            width: MediaQuery.of(context).size.width * 9 / 10,
            child: FittedBox(
                fit: BoxFit.fill,
                child: InkWell(
                    onTap: () async {
                      final response = await navigateToWidgetNormal<bool>(
                          context,
                          ProductDetailPage(
                              currentProduct: widget.currentProduct));

                      if (response is bool) {
                        setState(() {});
                      }
                    },
                    child: Image.asset(widget.currentProduct.picturePath)))),
        FavoriteButton(currentProduct: widget.currentProduct)
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
  final EdgeInsets productInformation =
      const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0);
}


/**Fitted box parent'inde bir yer varsa kaplar. o an aldığı yeri değil. belirli sayılar olması lazım oranlar değil */
