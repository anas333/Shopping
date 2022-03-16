import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  final Widget? child;
  final EdgeInsets? padding;
  final double? high, width;
  final Color mycontainercolor;
  final Color myBorderColor;

  const MyBox(
      {Key? key,
      this.padding,
      this.high,
      this.width,
      required this.child,
      required this.mycontainercolor,
      required this.myBorderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: high,
      width: width,
      decoration: BoxDecoration(
        color: mycontainercolor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: myBorderColor, width: 1),
      ),
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
