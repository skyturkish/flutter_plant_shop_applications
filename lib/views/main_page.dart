import 'package:flutter/material.dart';
import 'package:flutter_plant_shop_ui/core/Listview_horizontally_categories.dart';

import 'package:flutter_plant_shop_ui/core/container_picture.dart';
import 'package:flutter_plant_shop_ui/product/BottomNavigation.dart';
import 'package:flutter_plant_shop_ui/product/ProductListView.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: Paddingutilities().generalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(flex: 2, child: Top()),
              Expanded(flex: 4, child: FirstTexts()),
              Expanded(flex: 6, child: TextsOnPicture()),
              Expanded(flex: 2, child: ListViewCategories()),
              Expanded(flex: 14, child: ListViewProductItems()),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigtaionMyBar(),
       
      ),
    );
  }
}

class TextsOnPicture extends StatelessWidget {
  const TextsOnPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerBackgroundPicture(
      image: AssetImage(ImageItems().mainPagePictureVase),
      child: Padding(
        padding: Paddingutilities().picturePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextUtilities().brightenADay,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(TextUtilities().today,
                style: Theme.of(context).textTheme.headline5),
            const Spacer(),
            Text(TextUtilities().discountUntil,
                style: Theme.of(context).textTheme.subtitle2),
            Text(TextUtilities().discountThirty,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}

class FirstTexts extends StatelessWidget {
  const FirstTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextUtilities().findYour,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black),
        ),
        Text(
          TextUtilities().favoritePlant,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class Top extends StatelessWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.notifications_none)),
      ],
    );
  }
}

class TextUtilities {
  final String findYour = 'Find your';
  final String favoritePlant = 'Favorite plant';
  final String brightenADay = 'Brighten a Day,';
  final String today = 'Today';
  final String discountUntil = 'Discount until';
  final String discountThirty = '${DiscountUtilites().thirty}% Off';
}

class DiscountUtilites {
  final int thirty = 30;
}

class Paddingutilities {
  final EdgeInsets generalPadding = const EdgeInsets.all(18.0);
  final EdgeInsets picturePadding =
      const EdgeInsets.only(bottom: 20, top: 10.0, left: 15);
}

class ImageItems {
  final String mainPagePictureVase = "assets/jpg/mainPagePicture.jpg";
}
