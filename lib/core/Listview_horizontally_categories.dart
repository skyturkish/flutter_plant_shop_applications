import 'package:flutter/material.dart';

class ListViewCategories extends StatefulWidget {
  ListViewCategories({Key? key}) : super(key: key);

  @override
  State<ListViewCategories> createState() => _ListViewCategoriesState();
}

class _ListViewCategoriesState extends State<ListViewCategories> {
  @override
  Widget build(BuildContext context) {
    return Text("data");//ListView.builder(itemBuilder: (BuildContext context, int index) {  },);
  }
}