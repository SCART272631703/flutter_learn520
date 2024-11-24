import 'package:flutter/material.dart';

class HYStarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;
  HYStarRating(
      {required this.rating,
      this.maxRating = 10,
      this.size = 30,
      this.unselectedColor = const Color(0xffbbbbbb),
      this.selectedColor = const Color(0xffe0aa46),
      Widget? unselectedImage,
      Widget? selectedImage,
      this.count = 5,
      super.key})
      : unselectedImage = unselectedImage ??
            Icon(
              Icons.star,
              size: size,
              color: unselectedColor,
            ),
        selectedImage =
            selectedImage ?? Icon(Icons.star, size: size, color: selectedColor);
  @override
  HYStarRatingState createState() => HYStarRatingState();
}

class HYStarRatingState extends State<HYStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(mainAxisSize: MainAxisSize.min, children: getUnSelectImage()),
        Row(mainAxisSize: MainAxisSize.min, children: getSelectImage()),
      ],
    );
  }

  // 获取评星
  List<Widget> getUnSelectImage() {
    return List.generate(widget.count, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {
    // 1.计算Star个数和剩余⽐例等
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;
    // 2.获取start
    List<Widget> selectedImages = [];
    for (int i = 0; i < entireCount; i++) {
      selectedImages.add(widget.selectedImage);
    }
    // 3.计算
    Widget leftStar = ClipRect(
      clipper: MyRectClipper(width: leftRatio * widget.size),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);
    return selectedImages;
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  final double width;
  MyRectClipper({required this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}
