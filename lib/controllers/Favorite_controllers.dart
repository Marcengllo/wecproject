import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wecproject/model/model_card.dart';

class FavoritesController extends GetxController {
  late Database _db;
  var favoriteCards = <modelcard>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'favorites.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(imagePath TEXT, title TEXT, date TEXT, UNIQUE(title, date))',
        );
      },
      version: 1,
    );
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final List<Map<String, dynamic>> maps = await _db.query('favorites');
    favoriteCards.value = List.generate(maps.length, (i) {
      return modelcard(
        imagePath: maps[i]['imagePath'],
        title: maps[i]['title'],
        date: maps[i]['date'],
      );
    });
  }

  Future<void> addFavorite(modelcard card) async {
    final List<Map<String, dynamic>> result = await _db.query(
      'favorites',
      where: 'title = ? AND date = ?',
      whereArgs: [card.title, card.date],
    );

    if (result.isEmpty) {
      await _db.insert(
        'favorites',
        {
          'imagePath': card.imagePath,
          'title': card.title,
          'date': card.date,
        },
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      _loadFavorites();
    }
  }

  Future<void> removeFavorite(modelcard card) async {
    await _db.delete(
      'favorites',
      where: 'title = ? AND date = ?',
      whereArgs: [card.title, card.date],
    );
    _loadFavorites();
  }

  bool isFavorite(modelcard card) {
    return favoriteCards.any((element) =>
        element.title == card.title && element.date == card.date);
  }
}
