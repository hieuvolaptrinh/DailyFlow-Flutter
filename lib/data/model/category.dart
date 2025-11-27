class Category {
  late String id;
  late String name;
  late int? iconCodePoint;
  late String? backgroundColorHex;
  late String? iconColorHex;

  Category({
    required this.id,
    required this.name,
    this.iconCodePoint,
    this.backgroundColorHex,
    this.iconColorHex,
  });
}
