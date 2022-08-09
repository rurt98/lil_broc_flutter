import 'package:flutter/material.dart';
import 'package:lil_broc/widgets/custom_title_button.dart';

class AnalitycsPage extends StatelessWidget {
  const AnalitycsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 4.0,
        automaticallyImplyLeading: false,
        title: const CustomTitleButton(
          title: "Dashboard",
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Your Journey",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.help_outline,
                  size: 18.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
