import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInteractive extends StatelessWidget {
  ImageInteractive({this.imgUrl});
  String imgUrl;
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: Image.network(imgUrl));
  }
}
