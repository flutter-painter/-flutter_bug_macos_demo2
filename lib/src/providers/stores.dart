import 'package:flutter/widgets.dart';

class StoresProvider extends StatelessWidget {
  final Widget child;

  StoresProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
    //MultiProvider(
    //  providers: [
//      ],
//      child: child,
//    );
  }
}
