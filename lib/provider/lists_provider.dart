import 'package:flutter/material.dart';
import 'package:lil_broc/models/produce.dart';
import 'package:lil_broc/models/produce_selected.dart';
import 'package:uuid/uuid.dart';

class ListsProvider extends ChangeNotifier {
  final List<ProduceSelected> fridge = [];
  final List<ProduceSelected> shoppingList = [];

  void addToFringe(ProduceSelected produce) {
    fridge.add(produce);
    notifyListeners();
  }

  void addToShoppingList({required Produce produce, required int value}) {
    if (!shoppingList.any((p) => p.produce.id == produce.id)) {
      shoppingList.add(
        ProduceSelected(
          id: const Uuid().v1(),
          value: 1,
          unitSelected: "kilos(kg)",
          created: DateTime.now(),
          produce: produce,
        ),
      );
    } else {
      final i = shoppingList.indexWhere((p) => p.produce.id == produce.id);
      shoppingList[i].value = value;
    }
    notifyListeners();
  }

  void changeValueToShoppingListItem({required String id, required int value}) {
    final i = shoppingList.indexWhere((p) => p.id == id);
    shoppingList[i].value = value;
    notifyListeners();
  }

  void deleteProduceInShoppingList({required String id}) {
    shoppingList.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  void deleteProduceInFridge({required String id}) {
    fridge.removeWhere((p) => p.id == id);
    notifyListeners();
  }
}
