import 'package:floor/floor.dart';
import 'package:shopping/floor/entity/cart_clothes.dart';

@dao
abstract class ClothesDao {
  @Query('SELECT * FROM Clothes')
  Future<List<Clothes>> getAllClothes();

  @Query('SELECT * FROM Clothes WHERE id = :id')
  Future<Clothes?> getNamedClothes(int id);

  @Query('DELETE FROM Clothes WHERE id = :id')
  Future<void> clearClothesByName(int id);

  @Query('UPDATE FROM Clothes SET id= :id')
  Future<void> updateClothesByUid(int id);

  @insert
  Future<void> insertClothes(Clothes clothes);

  @update
  Future<int> updateClothes(Clothes clothes);

  @delete
  Future<void> deleteClothes(Clothes? clothes);
}
