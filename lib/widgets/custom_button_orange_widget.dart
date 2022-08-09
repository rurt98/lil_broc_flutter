import 'package:flutter/material.dart';
import 'package:lil_broc/theme/app_theme.dart';

class CustomButtonOrangeWidget extends StatelessWidget {
  final Function() onTap;
  final String txt;
  const CustomButtonOrangeWidget({
    Key? key,
    required this.onTap,
    required this.txt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width * 0.40,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppTheme.lilBrocOrange,
        ),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
