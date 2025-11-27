import 'package:realm/realm.dart';

part 'category_realm_entity.realm.dart'; // <- bắt buộc, tên trùng file generator sẽ tạo

@RealmModel()
class _CategoryRealmEntity {
  @PrimaryKey()
  late ObjectId id;

  late String name;
  late int? iconCodePoint;

  late String? backgroundColorHex;
  late String? iconColorHex;
}
