import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class Sql{
  static Database? _db;
  Future<Database?> get db async{
    if (_db==null){
      _db=await intialDB();
      return _db;
    }
    else{
      return _db;
    }
  }
  intialDB() async{
    String databasepath=await getDatabasesPath();
    String path=join(databasepath,'ALMoslim.db');
    Database mydb=await openDatabase(path,onCreate: _onCreate,version: 2);
    return mydb;
  }
  _onCreate(Database db,int version) async{
    await db.execute('''
    CREATE TABLE almoslim(
    id INTEGER PRIMARY KEY AUTOINCREMENT ,
    Fajr TEXT NOT NULL ,
    Dhuhr TEXT NOT NULL,
    Asr TEXT NOT NULL,
    Maghrib TEXT NOT NULL,
    Isha TEXT NOT NULL,
    DATE TEXT NOT NULL,
    hijri TEXT NOT NULL
    )
    ''');
    
    print("Create");
  }

  read (String sql) async{
    Database? mydb=await db;
    List<Map> response =[];
    try{
     response=await mydb!.query(sql);
    }
    catch(e){
      print("can't");
    }
    return response;
  }
  insert (String table ,Map<String,Object> values) async{
    Database? mydb=await db;
    try{
      int response =await mydb!.insert(table,values);

      return response;
    }
    catch(e){
      print("the name is exist");
    }

  }
  empty (String table ) async{
    Database? mydb=await db;
    try{
      mydb!.execute('''
    DELETE FROM $table
    ''');
    }
catch(e){
      return 0;
}
  }
  delete (String table , String? mywhere, [List<dynamic>? whereArgs]) async{
    Database? mydb=await db;
    int response =await mydb!.delete(table, where: mywhere, whereArgs: whereArgs);
    return response;
  }
  find(String table, String? mywhere, [List<dynamic>? whereArgs]) async {
    Database? mydb = await db;
    try {
      var response = await mydb!.query(table, where: mywhere, whereArgs: whereArgs);
      return response;
    }
    catch(e){
      return 0;
    }
  }
}