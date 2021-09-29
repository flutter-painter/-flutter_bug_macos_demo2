import 'package:flutter/material.dart';
import 'package:yobi/src/app/app_provider_russian_dolls.dart';
import 'package:yobi/src/app/appmaterial_routes.dart';
import 'package:yobi/src/functions/database/delete_db.dart';
import 'package:yobi/src/theme/yobi.dart';

// this is meant to ease DEV's pain

class AppEntryDeleteDatabase extends StatelessWidget {
  const AppEntryDeleteDatabase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: deleteDatabase(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    // direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Text(
                              'Suppresion de la base de données en cours',
                              textDirection: TextDirection.ltr,
                              style: defaultStyle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),
                    ]),
              ),
            );
          } else if (snapshot.hasError) {
            return const SizedBox();
          } else if (snapshot.connectionState == ConnectionState.done) {
            // return FetchTicketsOrNot();
            return InitProviderRussianDolls(AppMaterialRoutes());
          } else {
            // ? strange
            return ColoredBox(color: Colors.blue);
          }
        });
  }
}
