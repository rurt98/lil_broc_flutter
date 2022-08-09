import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lil_broc/helpers/constants.dart';
import 'package:lil_broc/models/produce_selected.dart';
import 'package:lil_broc/pages/add_item_page.dart';
import 'package:lil_broc/pages/fridge_page.dart';
import 'package:lil_broc/provider/lists_provider.dart';
import 'package:lil_broc/theme/app_theme.dart';
import 'package:lil_broc/widgets/add_button_widget.dart';
import 'package:lil_broc/widgets/dialog_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FringeInfoWidget extends StatefulWidget {
  const FringeInfoWidget({Key? key}) : super(key: key);

  @override
  State<FringeInfoWidget> createState() => _FringeInfoWidgetState();
}

class _FringeInfoWidgetState extends State<FringeInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final _listsProvider = Provider.of<ListsProvider>(context);
    final sizes = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SizedBox(
      height: sizes.height / 2.15,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            height: sizes.height / 2.3,
            decoration: AppTheme.boxDecoration(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const FridgePage(),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Your Fridge",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold),
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
                        Container(
                          height: 25,
                          width: 65,
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8.0,
                                8.0,
                                3.0,
                                8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${_listsProvider.fridge.length} Items",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  if (_listsProvider.fridge.isNotEmpty) ...[
                    SizedBox(
                      height: sizes.height / 2.78,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: _listsProvider.fridge.length,
                        itemBuilder: (BuildContext context, int i) {
                          final p = _listsProvider.fridge[i];
                          return _buildProduceInFridge(p);
                        },
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: Center(
                        child: Text(
                          "Your list is empty!\nAdd an item to track",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey[350]),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddButtonWidget(
              onPressed: () async {
                await showRightDialog(
                  context,
                  const AddItemPage(
                    typeNavigation: TypeNavigation.addToFridge,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProduceInFridge(ProduceSelected p) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 35,
                    child: Image.asset(
                      "assets/fruits_vegetables/${p.produce.image}",
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        p.produce.name,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        "${p.value} ${p.unitSelected} ${DateFormat('MMM d, yy').format(p.created)}",
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 16.0,
                lineWidth: 3.2,
                percent: 1.0,
                center: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      "10\ndays",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                progressColor: Colors.green,
                backgroundColor: Colors.grey[200]!,
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
