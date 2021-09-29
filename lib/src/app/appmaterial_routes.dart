import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rc_router/rc_router.dart';
import 'package:yobi/src/app/fetch_tickets_or_not.dart';
import 'package:yobi/src/routes/charts.dart';
import 'package:yobi/src/theme/yobi.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('route inconnue'),
      ),
    );
  }
}

class AppMaterialRoutes extends StatefulWidget {
  const AppMaterialRoutes();
  @override
  _AppMaterialRoutesState createState() => _AppMaterialRoutesState();
}

class _AppMaterialRoutesState extends State<AppMaterialRoutes> {
  final navigatorKey = GlobalKey<NavigatorState>();

  RcRoutes rcRoutes;

  @override
  void initState() {
    super.initState();

    rcRoutes = RcRoutes(
      notFoundRoute: (_) =>
          PageRouteBuilder(pageBuilder: (context, a, aa) => NotFound()),
      routes: [
        ChartsRoute(),
      ],
    );
  }

  static const Iterable<LocalizationsDelegate<dynamic>> delegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //navigatorObservers: [],
      locale: Locale('fr'),
      localizationsDelegates: delegates,
      supportedLocales: [const Locale('en'), const Locale('fr')],
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'yobi',
      theme: yobiTheme,
      home: FetchTicketsOrNot(),
      onGenerateRoute: rcRoutes.onGeneratedRoute,
    );
  }
}
