import 'package:flutter/material.dart';
import 'package:lil_broc/pages/analitycs_page.dart';
import 'package:lil_broc/theme/app_theme.dart';

class SaveVSWastedWidget extends StatelessWidget {
  const SaveVSWastedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Container(
      height: sizes.height / 4.15,
      decoration: AppTheme.boxDecoration(),
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const AnalitycsPage(),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saved vs Wasted",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          const Text(
                            "AVERAGE",
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        "0.0%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[200],
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 8.0),
              child: Row(
                children: [
                  _buildLinePercent(0),
                  _buildLinePercent(0),
                  _buildLinePercent(5),
                  _buildLinePercent(0),
                  _buildLinePercent(10),
                  _buildLinePercent(0),
                  _buildLinePercent(0),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                _buildDay("FR"),
                _buildDay("SA"),
                _buildDay("SU"),
                _buildDay("MO"),
                _buildDay("TU"),
                _buildDay("WE"),
                _buildDay("TH"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(String day) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 4.0,
        ),
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }

  Widget _buildLinePercent(
    int percent,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 4.0,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            Column(
              children: [
                Expanded(
                  flex: 10 - percent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: percent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[800],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
