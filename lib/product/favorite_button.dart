import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/IsFavoriteButtonn.dart';
import 'package:flutter_plant_shop_ui/models/ProductItem.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key, required this.currentProduct})
      : super(key: key);

  final ProductItem currentProduct;

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: IsFavoriteButton(currentProduct: widget.currentProduct),
      onPressed: () {
        
        setState(
          // Sadece tek bir widget'ı build etmek istiyorsan setState ile onu kendi widget'ına çekmen, özel widget'a gerekiyor.
          () => {
            widget.currentProduct.isFavorite = !widget.currentProduct.isFavorite
          },
        );
      },
    );
  }
}

// // Iconbutton kendisinden gelen bir paddingi var unutma 