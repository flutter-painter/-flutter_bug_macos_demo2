import 'package:flutter/material.dart';
import 'package:sembast/sembast.dart';
import 'package:yobi/src/app/loading.dart';
import 'package:yobi/src/theme/yobi.dart';
import 'package:yobi/src/core/globals.dart' as globals;

class FetchTicketsOrNot extends StatefulWidget {
  const FetchTicketsOrNot();

  @override
  _FetchTicketsOrNotState createState() => _FetchTicketsOrNotState();
}

class _FetchTicketsOrNotState extends State<FetchTicketsOrNot> {
  bool isLoading;
  bool isAddingTicketsInDb;
  String isProdString;
  TextStyle style;
  String deletionState;
  int ticketsToDownloadCount;
  int ticketDownloaded;
  int loops;
  int finishedLoops;
  List<Map<String, Object>> ticketsJonsSembastList = [];
  String macAddress;

  @override
  void initState() {
    super.initState();
    macAddress = globals.prefs?.getString('macAddress') ?? '';
    isProdString = globals.prefs?.getBool('isProd') == null
        ? ''
        : globals.prefs.getBool('isProd')
            ? 'prod'
            : 'test';
    deletionState = '';
    isLoading = false;
    isAddingTicketsInDb = false;
    ticketsToDownloadCount = 0;
    ticketDownloaded = 0;
    loops = 0;
    finishedLoops = 0;
    style = defaultStyle;
  }

  @override
  Widget build(BuildContext context) {
    return macAddress.isEmpty || macAddress.isEmpty // 2 + 2 == 4
        ? Loading()
        : isLoading
            ? Center(child: Text('''
chargement en cours...
        ''', style: style))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    key: Key('doubt_it'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.launch),
                        ),
                        Text('Démarrer', style: style),
                      ],
                    ),
                    onTap: () {
                      // print('i hear it');
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Loading()));
                    },
                  ),
                  GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.cloud_download),
                        ),
                        Text("download stuff" + ' $isProdString', style: style),
                      ],
                    ),
                    onTap: () async {
                      await fetchTicketsAtInit();
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Loading(),
                        ),
                      );
                    },
                  ),
                ],
              );
  }

  Future<void> fetchTicketsAtInit() async {
    setState(() => isLoading = true);

    // final database = Provider.of<Database>(context, listen: false);
    final _ticketsDbStore = intMapStoreFactory.store('tickets');
    final _ticketsBranchDbStore = intMapStoreFactory.store('tickets_branch');
    setState(() {
      deletionState = 'suppression ancien tickets en cours...';
    });

    Future.microtask(() {
      _ticketsDbStore.delete(globals.database);
      _ticketsBranchDbStore.delete(globals.database);
    });

    setState(() => deletionState = 'anciens tickets supprimés');
    // * DO STUFF
    // final temp = await DownloadTickets.ticketsCountMongo(
    //     globals.prefs.getBool('isProd'), globals.prefs.getString('macAddress'));
    // print('ticketsToDownloadCount ${DateTime.now()}');
    // setState(() {
    //   ticketsToDownloadCount = temp;
    //   loops = DownloadTickets.howManyLoops(ticketsToDownloadCount);
    // });
    // fetching tickets into db
    try {
      // old stuff
    } catch (e, stack) {
      print('$e');
      throw 'Erreur lors du téléchargements des tickets $e $stack';
    }

    // adding into db
    try {
      setState(() => isAddingTicketsInDb = true);
      await _ticketsDbStore.addAll(globals.database, ticketsJonsSembastList);
    } catch (e) {
      throw 'erreur instretion db $e';
    }
    print('tickets added in db ${DateTime.now()}');
  }
}
