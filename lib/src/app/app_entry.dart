import 'package:flutter/material.dart';
import 'package:yobi/src/app/app_entry_delete_db.dart';
import 'package:yobi/src/app/app_provider_russian_dolls.dart';
import 'package:yobi/src/core/globals.dart' as globals;
import 'package:yobi/src/app/appmaterial_routes.dart';
import 'package:flutter/foundation.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({Key key}) : super(key: key);

  Future<bool> getChoice(int counter) async {
    if (counter > 5) {
      return globals.prefs.getBool('isDelete') ?? false;
    } else {
      if (globals.prefs.getBool('isDelete') != true &&
          globals.prefs.getBool('isDelete') != false) {
        await Future.delayed(Duration(seconds: 1));
        print('globals.prefs.getBool ${globals.prefs.getBool('isDelete')}');
        counter += 1;
        await getChoice(counter);
      }
    }
    return globals.prefs.getBool('isDelete') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return 
    // final macAddress = globals.prefs.getString('macAddress') ?? '';
    // prefer using flavors and a .dev config instead
    // * macAddress.isEmpty
    2 + 2 == 4
        ? InitProviderRussianDolls(AppMaterialRoutes())
        : FutureBuilder<bool>(
            future: getChoice(0),
            builder: (_, snap) {
              if (snap.connectionState == ConnectionState.waiting)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        child: Text('Démarrer normalement'),
                        onTap: () async =>
                            await globals.prefs.setBool('isDelete', false)),
                    const SizedBox(height: 33),
                    GestureDetector(
                        child: Text('Effacer la db et démarrer'),
                        onTap: () async =>
                            await globals.prefs.setBool('isDelete', true)),
                  ],
                );
              else if (snap.connectionState == ConnectionState.done &&
                  snap.hasData) {
                globals.prefs.setBool('isDelete', null); // TODO test isDelete ok on launch
                return snap.data
                    ? AppEntryDeleteDatabase()
                    : InitProviderRussianDolls(AppMaterialRoutes());
              } else if (snap.hasError) {
                return const SizedBox();
              } else {
                return Text('nopeee');
              }
            });
  }
}
