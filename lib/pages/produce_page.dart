import 'package:flutter/material.dart';
import 'package:lil_broc/helpers/constants.dart';
import 'package:lil_broc/models/produce.dart';
import 'package:lil_broc/models/produce_selected.dart';
import 'package:lil_broc/provider/lists_provider.dart';
import 'package:lil_broc/theme/app_theme.dart';
import 'package:lil_broc/widgets/custom_button_orange_widget.dart';
import 'package:lil_broc/widgets/custom_title_button.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProducePage extends StatefulWidget {
  final TypeNavigation typeNavigation;
  final Produce produce;
  final String title;
  final Function() pop;

  const ProducePage({
    Key? key,
    required this.produce,
    required this.title,
    required this.typeNavigation,
    required this.pop,
  }) : super(key: key);

  @override
  State<ProducePage> createState() => _ProducePageState();
}

class _ProducePageState extends State<ProducePage> {
  @override
  Widget build(BuildContext context) {
    final _listsProvider = Provider.of<ListsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomTitleButton(
          title: widget.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                  color: AppTheme.lilBrocGreen!.withOpacity(0.3),
                  width: 1.0,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      "assets/fruits_vegetables/${widget.produce.image}",
                    ),
                  ),
                  Text(widget.produce.name),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonOrangeWidget(
                    onTap: () async {
                      if (widget.typeNavigation == TypeNavigation.addToList) {
                        _listsProvider.addToShoppingList(
                          produce: widget.produce,
                          value: 10,
                        );
                      } else {
                        _listsProvider.addToFringe(
                          ProduceSelected(
                            id: const Uuid().v1(),
                            value: 1,
                            unitSelected: "kilos(kg)",
                            created: DateTime.now(),
                            produce: widget.produce,
                          ),
                        );
                      }
                      await widget.pop();
                      Navigator.pop(context);
                    },
                    txt:
                        "Add to ${widget.typeNavigation == TypeNavigation.addToList ? "List" : "Fridge"}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
