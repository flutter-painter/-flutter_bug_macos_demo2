import 'package:flutter/widgets.dart';

class ServicesProvider extends StatelessWidget {
  final Widget child;

  ServicesProvider({@required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
    //MultiProvider(
    //  providers: [
    //...
    //      ],
    //      child: child,
    // );
  }
}
