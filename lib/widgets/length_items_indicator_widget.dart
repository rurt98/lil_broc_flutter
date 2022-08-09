import 'package:flutter/material.dart';

class LengthItemsIndicatorWidget extends StatelessWidget {
  final int length;
  final Color color;
  final Color txtColor;
  const LengthItemsIndicatorWidget({
    Key? key,
    required this.length,
    required this.color,
    required this.txtColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 65,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            length > 0 ? "$length items" : "Empty",
            style: TextStyle(
              color: txtColor,
            ),
          ),
        ),
      ),
    );
  }
}
