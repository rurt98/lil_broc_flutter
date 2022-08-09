import 'package:flutter/material.dart';
import 'package:lil_broc/pages/analitycs_page.dart';
import 'package:lil_broc/pages/perfil_page.dart';

import 'package:lil_broc/widgets/fringe_info_widget.dart';
import 'package:lil_broc/widgets/saved_vs_wasted_info.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(context, theme),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 20,
            ),
            FringeInfoWidget(),
            SizedBox(
              height: 13,
            ),
            SaveVSWastedWidget(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, ThemeData theme) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0.5,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const AnalitycsPage(),
                ),
              ),
              child: CircularPercentIndicator(
                radius: 20.0,
                lineWidth: 5.0,
                percent: 0.0,
                center: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FittedBox(
                    child: Icon(
                      Icons.spa,
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                    ),
                  ),
                ),
                progressColor: Colors.green,
                backgroundColor: Colors.grey[200]!,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Hey, Uriel",
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          iconSize: 35,
          splashRadius: 0.1,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const PerfilPage(),
            ),
          ),
          icon: Icon(
            Icons.account_circle,
            color: theme.primaryColor,
          ),
        )
      ],
    );
  }
}
