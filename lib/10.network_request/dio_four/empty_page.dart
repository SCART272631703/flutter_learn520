import 'package:flutter/material.dart';

import 'jd_device.dart';

class BlankPage extends StatelessWidget {
  final Color? backgroundColor;
  const BlankPage({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: JDDevice.width,
        height: JDDevice.height - 100,
        color: backgroundColor ?? Colors.white,
      ),
    );
  }
}
