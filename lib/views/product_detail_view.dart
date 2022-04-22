import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/CustomElevatedButton.dart';
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
                  flex: 13,
                  child: TopStack(widget: widget)),
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
                                color: ColorUtilities().amber,
                              ),
                              Text(
                                widget.currentProduct.score.toString() + "  ",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(color: ColorUtilities().amber),
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
                              icon: const Icon(Icons.arrow_downward)),
                          ValueListenableBuilder<int>(
                              valueListenable: number,
                              builder: (context, val, child) {
                                return Text(number2.toString());
                              }),
                          IconButton(
                              onPressed: () {
                                increaseNumber(++number2);
                              },
                              icon: const Icon(Icons.arrow_upward))
                        ],
                      )
                    ],
                  )),
              Price(widget: widget),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: ColorUtilities().greenAccent,
                  )),
              Expanded(flex: 3, child: AboutText(widget: widget)),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Padding(
                      padding: PaddingsUtilities().generalPadding,
                      child: CustomElevatedButton(
                        color: ColorUtilities().green,
                        text: TextsUtilitesDetail().buyNow,
                        colorText: ColorUtilities().white,
                        borderRadiusGeometry:
                            BorderRadiusUtilities().elevatedButtonBorderRadius,
                        onPressed: () {},
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class TopStack extends StatelessWidget {
  const TopStack({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ContainerBackgroundPicture(
            image: AssetImage(widget.currentProduct.picturePath),
            child: Text(" ")),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(widget.currentProduct.isFavorite);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
              FavoriteButton(
                  currentProduct: widget.currentProduct)
            ],
          ),
        )
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "\$" + widget.currentProduct.price.toString(),
          style: Theme.of(context).textTheme.headline5,
        ));
  }
}

class AboutText extends StatelessWidget {
  const AboutText({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductDetailPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            TextsUtilitesDetail().about,
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
          ]))
    ]);
  }
}

class BorderRadiusUtilities {
  final BorderRadiusGeometry elevatedButtonBorderRadius =
      BorderRadius.circular(20);
}

class ColorUtilities {
  final Color white = Colors.white;
  final Color green = Colors.green;
  final Color amber = Colors.amber;
  final Color greenAccent = Colors.greenAccent;
}

class PaddingsUtilities {
  final EdgeInsets generalPadding = const EdgeInsets.all(8.0);
}

class TextsUtilitesDetail {
  final String buyNow = 'BUY NOW';
  final String about = 'About';
}
