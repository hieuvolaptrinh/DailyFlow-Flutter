import 'package:dailyflow/data/model/category_model.dart';
import 'package:dailyflow/data/model/realm/category_realm_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:realm/realm.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> loadCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      final config = Configuration.local([CategoryRealmEntity.schema]);
      final realm = Realm(config);
      final categoriesRealm = realm.all<CategoryRealmEntity>();

      _categories = categoriesRealm
          .map(
            (e) => CategoryModel(
              id: e.id.hexString,
              name: e.name,
              iconCodePoint: e.iconCodePoint,
              backgroundColorHex: e.backgroundColorHex,
              iconColorHex: e.iconColorHex,
            ),
          )
          .toList();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }

  Future<bool> createCategory(
    String name,
    String backgroundColorHex,
    String iconColorHex,
    int? iconCodePoint,
  ) async {
    try {
      final config = Configuration.local([CategoryRealmEntity.schema]);
      final realm = Realm(config);

      final category = CategoryRealmEntity(
        ObjectId(),
        name,
        backgroundColorHex: backgroundColorHex,
        iconColorHex: iconColorHex,
        iconCodePoint: iconCodePoint,
      );

      realm.write(() {
        realm.add(category);
      });

      await loadCategories();
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future<bool> updateCategory(
    String categoryId,
    String name,
    String backgroundColorHex,
    String iconColorHex,
    int? iconCodePoint,
  ) async {
    try {
      final config = Configuration.local([CategoryRealmEntity.schema]);
      final realm = Realm(config);

      final category = realm.find<CategoryRealmEntity>(
        ObjectId.fromHexString(categoryId),
      );

      if (category != null) {
        realm.write(() {
          category.name = name;
          category.backgroundColorHex = backgroundColorHex;
          category.iconColorHex = iconColorHex;
          category.iconCodePoint = iconCodePoint;
        });

        await loadCategories();
        return true;
      }
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
