import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';

class IsFavoriteButton extends StatelessWidget {
  const IsFavoriteButton({
    Key? key,
    required this.currentProduct,
  }) : super(key: key);

  final ProductItem currentProduct;

  @override
  Widget build(BuildContext context) {
    return Icon(
      currentProduct.isFavorite ? Icons.favorite : Icons.favorite_outline_sharp,
      color: currentProduct.isFavorite ? Colors.red : Colors.black,
      size: 36,
    );
  }
}
