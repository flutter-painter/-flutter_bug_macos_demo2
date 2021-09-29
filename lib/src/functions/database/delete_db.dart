import 'dart:io';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path_provider/path_provider.dart';

Future<void> deleteDatabase() async {
  //var codec = getEncryptSembastCodec(password: 'fuytere');
  // Open the database with the codec
  Directory appDocDir = await getApplicationDocumentsDirectory();

  String path = join(appDocDir.path, 'demo.db');

  DatabaseFactory dbFactory = databaseFactoryIo;
  print('before entering db ${DateTime.now()}');
  await dbFactory.deleteDatabase(path); //  codec: codec,
  return;
}
