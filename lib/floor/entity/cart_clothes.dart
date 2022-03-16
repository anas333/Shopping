// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Clothes {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String name;

  final int price;
  final String imgUrl;

  Clothes(this.id, this.name, this.price, this.imgUrl);
}
