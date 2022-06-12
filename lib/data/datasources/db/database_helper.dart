import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ?? await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final dbPath = "$path/tapcart.db";

    var db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {}
}
