import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:my_care_archives/model/user_model/client_model.dart';
import 'package:my_care_archives/model/user_model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  String createTableUsersQuery = '''
    CREATE TABLE IF NOT EXISTS users (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        surname TEXT,
        email TEXT,
        password TEXT,
        company TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )
    ''';
  String createTableClientsQuery = '''
      CREATE TABLE IF NOT EXISTS clients (
        client_id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        surname TEXT,
        birthday TEXT,
        telephone TEXT,
        address TEXT,
        diagnosed TEXT,
        allergies TEXT,
        other_allergies TEXT,
        last_vaccines TEXT,
        health_service TEXT,
        doctor_name TEXT,
        address_service TEXT,
        subscription_number TEXT,
        service_address TEXT,
        representative_name TEXT,
        representative_relationship TEXT,
        representative_email TEXT,
        representative_tel TEXT,
        representative_address TEXT,
        note TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        user_id INTEGER,
        FOREIGN KEY (user_id) REFERENCES users(user_id)
      )
    ''';
  String createTableReportsQuery = '''
    CREATE TABLE IF NOT EXISTS reports (
      report_id INTEGER PRIMARY KEY AUTOINCREMENT,
      task TEXT,
      sub_task TEXT,
      note TEXT,
      report_at TEXT,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      user_id INTEGER,
      client_id INTEGER,
      FOREIGN KEY (user_id) REFERENCES users(user_id),
      FOREIGN KEY (client_id) REFERENCES users(client_id)
  )''';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'care.db');

    // Check if the database already exists
    bool exists = await databaseExists(path);

    if (!exists) {
      // If the database does not exist, create a new one
      await openDatabase(path, version: 1, onCreate: _createTable);
    } else {
      // If the database already exists, open and return it
      _database = await openDatabase(path, version: 1);
    }

    await _checkAndCreateTable();

    return _database!;
  }

  Future<void> _checkAndCreateTable() async {
    bool tableExists = await _doesTableExist('your_table_name');
    if (!tableExists) {
      await _createTable(_database!, 1);
    }
  }

  Future<void> _createTable(Database db, int version) async {
    await db.execute(createTableUsersQuery);
    await db.execute(createTableClientsQuery);
    await db.execute(createTableReportsQuery);
  }

  Future<bool> _doesTableExist(String tableName) async {
    var tables = await _database!.query(
      'sqlite_master',
      where: 'type = ? AND name = ?',
      whereArgs: ['table', tableName],
    );
    return tables.isNotEmpty;
  }

  Future<int> insertRecord(
      Map<String, dynamic> record, String tableName) async {
    return await _database!.insert(tableName, record);
  }

  Future<void> insertUser(UserModel user) async {
    //user.password?.value = hashPassword(user.password?.value);
    await _database!.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserModel?> authUser(String username, String password) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
      limit: 1,
    );

    if (result.isNotEmpty) {
      return UserModel.fromMap(result.first);
    } else {
      return null;
    }
  }

  Future<ClientModel?> getPatients(String username, String password) async {
    final db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'clients',
    );

    if (result.isNotEmpty) {
      return ClientModel.fromMap(result.first);
    } else {
      return null;
    }
  }
}
