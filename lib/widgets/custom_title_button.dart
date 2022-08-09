import 'package:flutter/material.dart';
import 'package:lil_broc/theme/app_theme.dart';

class CustomTitleButton extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomTitleButton({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_new_rounded,
            color: color ?? AppTheme.lilBrocOrange,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              color: color ?? AppTheme.lilBrocOrange,
              fontSize: 17,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
