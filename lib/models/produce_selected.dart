import 'package:lil_broc/models/produce.dart';

class ProduceSelected {
  final String id;
  int value;
  final String unitSelected;
  final DateTime created;
  final Produce produce;

  ProduceSelected({
    required this.id,
    required this.value,
    required this.unitSelected,
    required this.created,
    required this.produce,
  });
}
