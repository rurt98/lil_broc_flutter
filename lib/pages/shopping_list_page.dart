import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lil_broc/helpers/constants.dart';
import 'package:lil_broc/models/produce_selected.dart';
import 'package:lil_broc/pages/add_item_page.dart';
import 'package:lil_broc/provider/lists_provider.dart';
import 'package:lil_broc/widgets/add_button_widget.dart';

import 'package:lil_broc/widgets/dialog_widget.dart';
import 'package:lil_broc/widgets/length_items_indicator_widget.dart';
import 'package:provider/provider.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({Key? key}) : super(key: key);

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  @override
  Widget build(BuildContext context) {
    final _listsProvider = Provider.of<ListsProvider>(context);
    return Scaffold(
      appBar: _buildAppBar(context, _listsProvider.shoppingList.length),
      body: Stack(
        children: [
          Column(
            children: [
              _buildFromHistory(),
              const Divider(height: 1),
              if (_listsProvider.shoppingList.isNotEmpty) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listsProvider.shoppingList.length,
                    itemBuilder: (BuildContext context, int i) {
                      return _buildProduce(
                        _listsProvider.shoppingList[i],
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
                      "Your list is empty!\nAdd an item to log",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[350]),
                    ),
                  ),
                ),
              ],
            ],
          ),
          _buildAddbutton(context),
        ],
      ),
    );
  }

  Widget _buildProduce(
    ProduceSelected produceSelected,
    Color color,
    ListsProvider listsProvider,
  ) {
    return Slidable(
      key: ValueKey(produceSelected.id),
      startActionPane: ActionPane(
        extentRatio: 0.15,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              listsProvider.addToFringe(produceSelected);
              listsProvider.deleteProduceInShoppingList(id: produceSelected.id);
            },
            backgroundColor: Colors.lightGreen[400]!,
            foregroundColor: Colors.white,
            icon: Icons.kitchen,
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.15,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => listsProvider.deleteProduceInShoppingList(
                id: produceSelected.id),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      child: Container(
        color: color,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 15),
              child: Row(
                children: [
                  _buildButtonItem(
                    icon: Icons.add,
                    color: Theme.of(context).primaryColor,
                    onTap: () => listsProvider.changeValueToShoppingListItem(
                      id: produceSelected.id,
                      value: produceSelected.value += 1,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  _buildProduceInfo(produceSelected),
                  const SizedBox(
                    width: 20,
                  ),
                  _buildButtonItem(
                    icon: Icons.remove,
                    color: Colors.grey[350]!,
                    onTap: () {
                      if (produceSelected.value != 1) {
                        listsProvider.changeValueToShoppingListItem(
                          id: produceSelected.id,
                          value: produceSelected.value -= 1,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // const CustomDividerWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildProduceInfo(ProduceSelected produceSelected) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                child: FittedBox(
                  child: Image.asset(
                    "assets/fruits_vegetables/${produceSelected.produce.image}",
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produceSelected.produce.name,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    produceSelected.produce.estimatedLife,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(produceSelected.value.toString()),
              Text(
                produceSelected.unitSelected,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtonItem({
    required Function() onTap,
    required IconData icon,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildFromHistory() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.history,
            color: Colors.grey,
            size: 20,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            "Add from History",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          Icon(
            Icons.keyboard_arrow_up_rounded,
            color: Colors.grey,
            size: 30,
          )
        ],
      ),
    );
  }

  Widget _buildAddbutton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: AddButtonWidget(
          onPressed: () async => await showRightDialog(
            context,
            const AddItemPage(
              typeNavigation: TypeNavigation.addToList,
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(BuildContext context, int productsLength) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(65.0),
      child: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        titleSpacing: 0.5,
        title: Align(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      "Shopping List",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
                LengthItemsIndicatorWidget(
                  length: productsLength,
                  color: Colors.teal[100]!,
                  txtColor: Colors.black45,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
