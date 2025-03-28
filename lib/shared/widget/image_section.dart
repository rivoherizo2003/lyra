import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    Key? key, 
    required this.image,
    this.maxHeight = 280.0,
  }) : super(key: key);

  final String image;
  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          constraints: BoxConstraints(
            maxHeight: maxHeight,
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}