import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:yobi/src/functions/database/init_db.dart';
import 'package:yobi/src/providers/database.dart';
import 'package:yobi/src/providers/rpc/rpcs.dart';
import 'package:yobi/src/providers/services/services.dart';
import 'package:yobi/src/providers/stores.dart';
import 'package:yobi/src/theme/yobi.dart';

class InitProviderRussianDolls extends StatelessWidget {
  final Widget materialApp;
  const InitProviderRussianDolls(this.materialApp);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initDatabase(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  // direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text('Chargement en cours', // de la base de données
                              style: defaultStyle),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  ]),
            );
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data is Database) {
            return DatabaseProvider(
              database: snapshot.data,
              child: RpcsProvider(
                child: ServicesProvider(
                  child: StoresProvider(
                    child: materialApp,
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const SizedBox();
          } else {
            // ? strange
            return ColoredBox(color: Colors.blue);
          }
        });
  }
}
