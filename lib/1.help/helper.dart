import 'package:flutter/material.dart';

void log(String message) {
  debugPrint(message);
}

int currentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch;
}

void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message)),
      duration: const Duration(milliseconds: 2000),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black54,
      shape: const StadiumBorder(
        side: BorderSide(width: 5, color: Colors.transparent),
      ),
    ),
  );
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            decoration: TextDecoration.none),
      ),
    );
  }
}

class MyText extends Text {
  const MyText(super.data, {super.key})
      : super(
          style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              decoration: TextDecoration.none),
        );
}

class MyTextSmall extends Text {
  const MyTextSmall(super.data, {super.key})
      : super(
          style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
              decoration: TextDecoration.none),
        );
}

class MyButton extends TextButton {
  MyButton({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    ButtonStyle? style,
    super.focusNode,
    Clip clipBehavior = Clip.none,
    required super.child,
  }) : super(
          style: style ??
              TextButton.styleFrom(
                padding: const EdgeInsets.all(5.0),
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
          autofocus: false,
          clipBehavior: clipBehavior,
        );
}
