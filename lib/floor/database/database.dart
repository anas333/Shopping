import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../dao/cart_dao.dart';
import '../entity/cart_clothes.dart';
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Clothes])
abstract class AppDatabase extends FloorDatabase {
  ClothesDao get clothesDao;
}
