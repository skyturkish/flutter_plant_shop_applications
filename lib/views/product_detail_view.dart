
import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/container_picture.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SafeArea(
        child: Padding(
          padding: PaddingUtilites().generalPadding,
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
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.currentProduct.name,style: Theme.of(context).textTheme.headline6,),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.amber,),
                              Text(widget.currentProduct.score.toString()+"   ",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.amber),),
                              Text("("+widget.currentProduct.reviews.toString()+")",style: Theme.of(context).textTheme.subtitle2)
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [],
                      )
                    ],
                  )),
              Text(
                '\$40.50',
                style: Theme.of(context).textTheme.headline4,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.black,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
