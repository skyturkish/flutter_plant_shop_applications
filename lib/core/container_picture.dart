import 'package:flutter/material.dart';

class ContainerBackgroundPicture extends StatelessWidget {
  const ContainerBackgroundPicture({
    Key? key, required this.image, required this.child,
  }) : super(key: key);
  final ImageProvider<Object> image;
  final Widget child;
  @override
  Widget build(BuildContext context) { // Verdiğin resmi arka planı yapıyor
    return Container(
      width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
        child: child /* add child content here */,
      );
  }
}

