import 'dart:io';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

import 'package:yobi/src/core/globals.dart' as globals;

Future<Database> initDatabase() async {
  //var codec = getEncryptSembastCodec(password: 'fuytere');
  // Open the database with the codec
  Directory appDocDir = await getApplicationDocumentsDirectory();

  String path = join(appDocDir.path, 'demo.db');

  DatabaseFactory dbFactory = databaseFactoryIo;
  print('before entering db ${DateTime.now()}');
  Database database =
      await dbFactory.openDatabase(path, version: 1); //  codec: codec,
  print('after open db ${DateTime.now()}');
  //Database database = await dbFactory.openDatabase(path, version: 1);

  // stuff remove
  globals.database = database;
  return database;
}
