import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lil_broc/helpers/constants.dart';
import 'package:lil_broc/models/produce_selected.dart';
import 'package:lil_broc/pages/add_item_page.dart';
import 'package:lil_broc/provider/lists_provider.dart';
import 'package:lil_broc/theme/app_theme.dart';
import 'package:lil_broc/widgets/add_button_widget.dart';

import 'package:lil_broc/widgets/custom_title_button.dart';
import 'package:lil_broc/widgets/dialog_widget.dart';
import 'package:lil_broc/widgets/length_items_indicator_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class FridgePage extends StatefulWidget {
  const FridgePage({Key? key}) : super(key: key);

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  @override
  Widget build(BuildContext context) {
    final _listsProvider = Provider.of<ListsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 4.0,
        automaticallyImplyLeading: false,
        title: const CustomTitleButton(
          title: "Dashboard",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.help_outline,
              size: 20.0,
              color: AppTheme.lilBrocOrange,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "Your Fridge",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    LengthItemsIndicatorWidget(
                      length: _listsProvider.fridge.length,
                      color: Theme.of(context).primaryColor,
                      txtColor: Colors.white,
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              if (_listsProvider.fridge.isNotEmpty) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listsProvider.fridge.length,
                    itemBuilder: (_, int i) {
                      final p = _listsProvider.fridge[i];
                      return _buildProduce(
                        p,
                        (i % 2) == 0 ? Colors.white : Colors.transparent,
                        _listsProvider,
                      );
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
          _buildAddbutton(context)
        ],
      ),
    );
  }

  Widget _buildAddbutton(BuildContext context) {
    return SafeArea(
      top: false,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AddButtonWidget(
            onPressed: () async => await showRightDialog(
              context,
              const AddItemPage(typeNavigation: TypeNavigation.addToFridge),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProduce(
    ProduceSelected p,
    Color color,
    ListsProvider listsProvider,
  ) {
    return Column(
      children: [
        Slidable(
          key: ValueKey(p.id),
          startActionPane: ActionPane(
            extentRatio: 0.15,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) => listsProvider.deleteProduceInFridge(id: p.id),
                backgroundColor: Colors.lightGreen[400]!,
                foregroundColor: Colors.white,
                icon: Icons.restaurant,
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.15,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (_) => listsProvider.deleteProduceInFridge(id: p.id),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            color: color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
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
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          "${p.value} ${p.unitSelected} - ${DateFormat('MMM d, yy').format(p.created)}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 25.0,
                  lineWidth: 5.5,
                  percent: 1.0,
                  center: const Padding(
                    padding: EdgeInsets.all(12.0),
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
        ),
        const Divider(height: 1),
      ],
    );
  }
}
