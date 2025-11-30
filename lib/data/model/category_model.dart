class CategoryModel {
  late String id;
  late String name;
  late int? iconCodePoint;
  late String? backgroundColorHex;
  late String? iconColorHex;

  CategoryModel({
    required this.id,
    required this.name,
    this.iconCodePoint,
    this.backgroundColorHex,
    this.iconColorHex,
  });
}
