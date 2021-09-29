import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:yobi/src/routes/charts.dart';
import 'package:yobi/src/views/charts/charts_frame.dart';

class Loading extends StatefulWidget {
  const Loading({Key key});
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    // final appStore = Provider.of<AppStore>(context, listen: false);

    when(
      (_) => 2 + 2 == 4,
      () {
        Navigator.of(context).pushNamed(ChartsRoute.routePath);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChartsView();
  }
}
