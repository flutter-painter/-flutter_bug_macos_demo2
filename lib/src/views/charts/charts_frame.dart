import 'package:flutter/material.dart';

class ChartsView extends StatefulWidget {
  ChartsView();

  @override
  _ChartsViewState createState() => _ChartsViewState();
}

class _ChartsViewState extends State<ChartsView> {
  @override
  Widget build(BuildContext context) {
    // final ticketsStore = Provider.of<TicketsStore>(context, listen: false);
    // final shopsStore = Provider.of<ShopsStore>(context, listen: false);
    //final dashboard = Provider.of<DashboardStore>(context, listen : false);
    //dashboard.addAllShops(shopsStore.shops);
    // List<Shop> shops = shopsStore.shops;

    return Center(child: Text('well well well'));
  }
}
