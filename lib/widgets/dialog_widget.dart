import 'package:flutter/material.dart';

Future<T?> showRightDialog<T extends Object?>(
  BuildContext context,
  Widget child,
) {
  return showGeneralDialog<T>(
    context: context,
    barrierColor: Colors.black12.withOpacity(0.2), // background color
    barrierDismissible: true, // should dialog be dismissed when tapped outside
    barrierLabel: "Dialog", // label for barrier
    transitionDuration: const Duration(
      milliseconds: 200,
    ), // how long it takes to popup dialog after button click
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
    pageBuilder: (_, __, ___) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SizedBox(
              // decoration: AppTheme.decorationCardInfo(context),
              width: 7,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
            child: child,
          ),
        ],
      );
    },
  );
}
