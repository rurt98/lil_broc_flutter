class Produce {
  final int id;
  final String name;
  final String image;
  final String lifeFresh;
  final String lifeFrozen;
  final String curiousFact;
  final String proprerStorage;
  final String improperStorage;
  final String freshRange;
  final String frozenRange;
  final String extendLifeSpan;
  final String freezerInstructions;
  final String seasonInfo;
  final String originInfo;
  final List<String> unit;
  final String estimatedLife;
  int? value;
  String? unitSelected;
  DateTime? created;

  Produce({
    required this.id,
    required this.name,
    required this.image,
    required this.lifeFresh,
    required this.lifeFrozen,
    required this.curiousFact,
    required this.proprerStorage,
    required this.improperStorage,
    required this.freshRange,
    required this.frozenRange,
    required this.extendLifeSpan,
    required this.freezerInstructions,
    required this.seasonInfo,
    required this.originInfo,
    required this.unit,
    required this.estimatedLife,
    this.value = 1,
    this.unitSelected,
    this.created,
  });
}
