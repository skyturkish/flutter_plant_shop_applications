import 'package:flutter/material.dart';

class CountNumber extends StatefulWidget {
  CountNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  int number;

  @override
  State<CountNumber> createState() => _CountNumberState();
}

class _CountNumberState extends State<CountNumber> {
  late int _message;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('c');
  }

  @override
  void didUpdateWidget(covariant CountNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('d');

    if (oldWidget.number != widget.number) {
      _message = widget.number;
      print('b');

      setState(() {});
    }
  }

  @override
  void initState() {
    _message = widget.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message.toString());
  }
}
