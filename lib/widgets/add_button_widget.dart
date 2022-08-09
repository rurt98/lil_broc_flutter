import 'package:flutter/material.dart';
import 'package:lil_broc/theme/app_theme.dart';

class AddButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const AddButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.lilBrocOrange,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 5,
          )
        ],
      ),
      child: IconButton(
        splashRadius: 0.1,
        iconSize: 40,
        onPressed: onPressed,
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
