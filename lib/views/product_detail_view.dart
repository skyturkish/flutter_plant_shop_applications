import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/container_picture.dart';
import 'package:flutter_plant_shop_ui/core/deneme.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';
import 'package:flutter_plant_shop_ui/product/ProductListView.dart';
import 'package:flutter_plant_shop_ui/product/favorite_button.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.currentProduct})
      : super(key: key);
  final ProductItem currentProduct;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int number2 = 0;
  final ValueNotifier<int> number = ValueNotifier(0);
  increaseNumber(int newNumber) {
    // do something to rebuild only 1st column Text not the whole page
    number2 = newNumber;
    number.value = number.value++;
  }

  decreaseNumber(int newNumber) {
    // do something to rebuild only 1st column Text not the whole page
    number2 = newNumber;
    number.value = number.value--;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: PaddingUtilites().generalDetailPadding,
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(widget.currentProduct.isFavorite);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      FavoriteButton(currentProduct: widget.currentProduct)
                    ],
                  )),
              Expanded(
                  flex: 11,
                  child: ContainerBackgroundPicture(
                      image: AssetImage(widget.currentProduct.picturePath),
                      child: Text(" "))),
              Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.currentProduct.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                widget.currentProduct.score.toString() + "  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: Colors.amber),
                              ),
                              Text(
                                  "(" +
                                      widget.currentProduct.reviews.toString() +
                                      ")",
                                  style: Theme.of(context).textTheme.subtitle2)
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                decreaseNumber(--number2);
                              },
                              icon: Icon(Icons.arrow_downward)),
                          ValueListenableBuilder<int>(
                              valueListenable: number,
                              builder: (context, val, child) {
                                return Text(number2.toString());
                              }),
                          IconButton(
                              onPressed: () {
                                increaseNumber(++number2);
                              },
                              icon: Icon(Icons.arrow_upward))
                        ],
                      )
                    ],
                  )),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\$" + widget.currentProduct.price.toString(),
                    style: Theme.of(context).textTheme.headline5,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  )),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "About",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: ListView(children: [
                            Text(
                              widget.currentProduct.about,
                              style: Theme.of(context).textTheme.subtitle2,
                            )
                          ])),
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            minimumSize: Size.fromWidth(MediaQuery.of(context).size.width),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),

                            ),
                          ),
                          onPressed: () {},
                          child: Text('BUY NOW',style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),)),
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
