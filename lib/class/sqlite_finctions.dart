import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqlite_future_builder/class/user.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "UserDb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          /*'id':id,
      'name':name,
      'email':email,
      'adresse':adresse,
      'age':age,
      'phoneNumber':phoneNumber */
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "email TEXT,"
          "adresse TEXT,"
          "age INTEGER,"
          "phoneNumber TEXT"
          ")");
    });
  }

  newUser(User newUser) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM User");
    print(table.first['id']);int id;(table.first['id']).toString();
    // ignore: prefer_is_empty
    table.first.isEmpty ?  id=1: id=int.parse((table.first['id']).toString()) +1;
    //int id =table.first.length+1;
    
   
    
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into User (id,name,email,adresse, age, phoneNumber)"
        " VALUES (?,?,?,?,?,?)",
        [id, newUser.name,newUser.email, newUser.adresse, newUser.age, newUser.phoneNumber]);
    return raw;
  }



  updateUser(User newUser) async {
    final db = await database;
    var res = await db.update("User", newUser.toMap(),
        where: "id = ?", whereArgs: [newUser.id]);
    return res;
  }

  getUser(int id) async {
    final db = await database;
    var res = await db.query("User", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  /*Future<List<User>> getBlockedUsers() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM User WHERE blocked=1");
    var res = await db.query("User", where: "blocked = ? ", whereArgs: [1]);

    List<User> list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [];
    return list;
  }*/

  Future<List<User>> getAllUsers() async {
    final db = await database;
    var res = await db.query("User");
    
      return res.isNotEmpty ?  (res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : [])
       : [];
    
  }

  deleteUser(int id) async {
    final db = await database;
    return db.delete("User", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from User");
  }
 

}

Stream<List<User>> getAllDatabaseUsers() async* {
  List<User> userList = await DBProvider.db.getAllUsers();
  StreamController<List<User>> streamController = 
     StreamController();
  userList.map((user){
    List<User> u=[user];
    streamController.add(u);});
    yield* streamController.stream;
}



//for(int i=0; i<Users.length; i++){}
// Stream<User> UserStream;