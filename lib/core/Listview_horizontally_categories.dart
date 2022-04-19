import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewCategories extends StatefulWidget {
  const ListViewCategories({Key? key}) : super(key: key);

  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
  late final List<Categories> _items;

  @override
  void initState() {
    _items = CategoriesItems().items;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        final Categories currentItem = _items[index];
        return Padding(
          padding: PaddingUtilities().categoriyPadding,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                currentItem.isSelected = !currentItem.isSelected;
              });
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                primary: currentItem.isSelected
                    ? ColorUtilities().green
                    : ColorUtilities().white),
            child: Text(
              currentItem.name,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: currentItem.isSelected ? ColorUtilities().white : null,
                  ),
            ),
          ),
        );
      },
    ); //ListView.builder(itemBuilder: (BuildContext context, int index) {  },);
  }
}

class ColorUtilities {
  final Color green = Colors.green;
  final Color white = Colors.white;
}

class PaddingUtilities {
  final EdgeInsets categoriyPadding =
      const EdgeInsets.only(right: 10.0, top: 10.0,bottom: 5.0);
}

class Categories {
  final String name;
  bool isSelected;
  Categories({
    required this.name,
    this.isSelected = false,
  });
}

class CategoriesNames {
  final String popular = "Popular";
  final String inDoor = "In Door";
  final String outDoor = "Out Door";
  final String organic = "Organic";
  final String synthetic = "Synthetic";
  final String adana = "Adana";
}

class CategoriesItems {
  CategoriesNames categoriesNames = CategoriesNames();
  late final List<Categories> items;
  CategoriesItems() {
    items = [
      Categories(name: categoriesNames.adana),
      Categories(name: categoriesNames.inDoor),
      Categories(name: categoriesNames.organic),
      Categories(name: categoriesNames.outDoor),
      Categories(name: categoriesNames.popular),
      Categories(name: categoriesNames.synthetic),
    ];
  }
}
