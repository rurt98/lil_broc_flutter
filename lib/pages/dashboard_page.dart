import 'package:flutter/material.dart';
import 'package:lil_broc/pages/home_page.dart';
import 'package:lil_broc/pages/shopping_list_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  int pageIndex = 0;
  final pages = [
    const HomePage(),
    const ShoppingListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: _buildNavigationBart(context),
    );
  }

  Widget _buildNavigationBart(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(left: 100.0, right: 100.0, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Icon(
                Icons.view_day,
                color: pageIndex == 0
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Icon(
                Icons.dns,
                color: pageIndex == 1
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
