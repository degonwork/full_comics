


import 'dart:convert';

import 'package:full_comics/data/models/manga_models/hot_comics_model.dart';
import 'package:full_comics/data/repo/manga_repo/hot_commic_repo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
// import '../models/data_models.dart/commic_model.dart';

class CommicDB {
  // static const String table = 'hotcomics';
  // static const String image = 'image';
  // static const String title = 'title';
  late HotCommicRepo hotCommicRepo;
  CommicDB._init();
  static final CommicDB instance = CommicDB._init();
  static Database? _database;
  Future<Database> get database async{
    if (_database != null)return _database!; {
      _database = await _initDB('commic.db');
      return _database!;
    }
  }
  Future<Database> _initDB(String filePath)async{
     final dbPath = await getDatabasesPath();
     final path = join(dbPath,filePath);
     return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db,int version) async{
   
   await db.execute(''' CREATE TABLE $tableHotComics(
     image TEXT, title TEXT, id TEXT
   ) ''');
  }
  Future<void> createHotComic(HotComic hotComic)async{
    final db = await instance.database;
    final map = hotComic.toMap();
   await db.insert(tableHotComics, map,conflictAlgorithm: ConflictAlgorithm.replace);
  
  }
 
 Future<List<HotComic>> readListHotCommic() async{
  final db = await instance.database;
  final List<Map<String, dynamic>> results = await db.query(tableHotComics);
 final listHotCommic = results.map((json) => HotComic.fromJson(json)).toList();
 
 return listHotCommic;
 }
Future<void> updateHotComic(HotComic hotComic) async{
  final db = await instance.database;
  final map = hotComic.toMap();
  await db.update(tableHotComics, map,whereArgs: [hotComic.id],conflictAlgorithm: ConflictAlgorithm.replace,where: 'id = ?');


}
Future close() async{
  final db = await instance.database;
  db.close();
}
}