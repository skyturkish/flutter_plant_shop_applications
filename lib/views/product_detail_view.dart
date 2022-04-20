import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key, required this.current_item}) : super(key: key);
final ProductItem current_item;
  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(widget.current_item.isFavorite.toString(),style: Theme.of(context).textTheme.headline1,),);
  }
}