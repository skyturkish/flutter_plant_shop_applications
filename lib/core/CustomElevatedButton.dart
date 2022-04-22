import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.color,
    required this.borderRadiusGeometry,
    required this.text,
    required this.colorText,
    required this.onPressed,
  }) : super(key: key);
  final Color color;
  final BorderRadiusGeometry borderRadiusGeometry;
  final String text;
  final Color colorText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size.fromWidth(MediaQuery.of(context).size.width),
          shape: RoundedRectangleBorder(borderRadius: borderRadiusGeometry),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.headline6!.copyWith(color: colorText),
        ));
  }
}
